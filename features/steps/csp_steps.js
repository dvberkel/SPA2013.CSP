module.exports = function(){
    this.Given(/^I have a CSP problem$/, function(callback) {
	// express the regexp above with the code you wish you had
	callback.pending();
    });

    this.Given(/^I have a variable 'X' with domain \[(\d+), (\d+), (\d+)\]$/, function(arg1, arg2, arg3, callback) {
	// express the regexp above with the code you wish you had
	callback.pending();
    });

    this.When(/^I solve the problem$/, function(callback) {
	// express the regexp above with the code you wish you had
	callback.pending();
    });

    this.Then(/^I expect solutions$/, function(table, callback) {
	// express the regexp above with the code you wish you had
	callback.pending();
    });

    this.Given(/^I have a variable 'Y' with domain \[(\d+), (\d+)\]$/, function(arg1, arg2, callback) {
	// express the regexp above with the code you wish you had
	callback.pending();
    });

    this.Given(/^I have a constraint: X = Y$/, function(callback) {
	// express the regexp above with the code you wish you had
	callback.pending();
    });

    this.Given(/^I have a constraint: X != Y$/, function(callback) {
	// express the regexp above with the code you wish you had
	callback.pending();
    });

    this.Given(/^I have a constraint: X = Y \+ (\d+)$/, function(arg1, callback) {
	// express the regexp above with the code you wish you had
	callback.pending();
    });
};