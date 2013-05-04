(function(worker){
    var solverFor = (function(undefined){
	var pico = function(template){
	    var _regexp = /\{\{(\w*)\}\}/g;
	    return function(data) {
		return template.replace(_regexp, function(str, key){
		    return data[key];
		});
	    }
	};

	var copy = function(target){
	    return target.slice(0);
	};

	var IndicesGenerator = (function(){
	    var startIndicesFor = function(maximums) {
		var indices = [];
		for (var index = 0; index < maximums.length; index++){
		    indices.push(0);
		}
		return indices;
	    }

	    var next = function(maximums, current) {
		var next = copy(current);
		var index = 0;
		next[index] = next[index] + 1;
		while (index < maximums.length && next[index] >= maximums[index]) {
		    next[index] = 0;
		    index++;
		    next[index] = next[index] + 1;
		}
		if(index < maximums.length) {
		    return next;
		}
		return undefined;
	    }


	    return function(maximums){
		this.all = function(callback){
		    var current = startIndicesFor(maximums);
		    do {
			callback.call(current);
		    } while (current = next(maximums, current))
		};
	    };
	})();

	var IndicesMapGenerator = (function(){
	    var namesOf = function(variables) {
		var names = [];
		for (var name in variables) {
		    names.push(name);
		}
		return names;
	    };

	    var maximumsFor = function(variables, names) {
		var result = [];
		for (var index = 0; index < names.length; index++) {
		    result.push(variables[names[index]].length);
		}
		return result;
	    };

	    var createIndicesMap = function(names, indices){
		var result = {};
		for (var index = 0; index < names.length; index++){
		    result[names[index]] = indices[index];
		}
		return result;
	    };

	    return function(variables){
		var names = namesOf(variables);
		this.all = function(callback){
		    var generator = new IndicesGenerator(maximumsFor(variables, names));
		    generator.all(function(){
			callback.call(createIndicesMap(names,this));
		    });
		};
	    };
	})();

	var CandidateGenerator = (function(){
	    var createCandidateFrom = function(problem, indices) {
		candidate = {};
		for (var name in indices) {
		    candidate[name] = problem.variables[name][indices[name]];
		}
		return candidate;
	    }

	    return function(problem) {
		this.all = function(callback){
		    var generator = new IndicesMapGenerator(problem.variables);

		    generator.all(function(){
			callback.call(createCandidateFrom(problem, this));
		    });
		};
	    };
	})();

	var candidatesFor = function candidatesFor(problem){
	    return new CandidateGenerator(problem);
	}

	var ConstraintChecker = (function(){
	    var template = pico("with(this){ return {{constraint}}; }");

	    var createConstraint = function(description){
		return Function(template({ constraint : description }));
	    };

	    var createConstraints = function(constraints){
		var result = [];
		for (var index = 0; index < constraints.length; index++){
		    result.push(createConstraint(constraints[index]));
		}
		return result;
	    };

	    return function(problem) {
		var constraints = createConstraints(problem.constraints);
		this.check = function(candidate){
		    for (var index = 0; index < constraints.length; index++) {
			if (!constraints[index].call(candidate)) {
			    return false;
			}
		    }
		    return true;
		}
	    };
	})();

	var constraintCheckerFor = function(problem) {
	    return new ConstraintChecker(problem);
	};

	var Solver = function(problem){
	    var candidates = candidatesFor(problem);
	    var checker = constraintCheckerFor(problem);
	    this.all = function(callback) {
		candidates.all(function(){
		    if (checker.check(this)) {
			callback.call(this);
		    }
		});
	    }
	}

	return function solverFor(problem){
	    return new Solver(problem);
	};
    })();

    worker.addEventListener("message", function(event){
	solverFor(event.data).all(function(){
	    worker.postMessage({ id : event.data.id, solution : this });
	});
    });
})(this);
