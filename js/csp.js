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
	var handler = function(event){
	    if (event.data.id === id) {
		if (event.data.type === "solution") {
		    callback.call(event, event.data.solution);
		}
		if (event.data.type === "finished") {
		    worker.removeEventListener("message", handler);
		}
	    } else {
		console.log("intermittent")
	    }
	};
	worker.addEventListener("message", handler);

	worker.postMessage(problem);
    }

    return {
	solve : solve
    };
})();
