var CSP = (function(undefined){
    var worker = new Worker("js/csp.worker.js");

    var generator = (function(){
	var id = 0;
	return {
	    next : function(){ return id++; }
	}
    })();

    var solve = function(problem, callback) {
	var id = problem.id = generator.next();
	worker.addEventListener("message", function(event){
	    if (event.data.id === id) {
		callback.call(event, event.data.solution);
	    }
	});

	worker.postMessage(problem);
    }

    return {
	solve : solve
    };
})();
