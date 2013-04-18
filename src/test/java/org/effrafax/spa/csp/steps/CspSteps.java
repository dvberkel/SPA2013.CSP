package org.effrafax.spa.csp.steps;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import cucumber.runtime.PendingException;

public class CspSteps {
	@Given("^I have a CSP problem$")
	public void I_have_a_CSP_problem() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Given("^I have a variable '\\w+' with domain \\[(.*)\\]$")
	public void I_have_a_variable_X_with_domain_(String variable, String domain) throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Given("^I have a constraint: (.*)$")
	public void I_have_a_constraint(String constraint) throws Throwable {
		// Express the Regexp above with the code you wish you had
		throw new PendingException();
	}

	@When("^I solve the problem$")
	public void I_solve_the_problem() throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    throw new PendingException();
	}

	@Then("^I expect solutions$")
	public void I_expect_solutions(DataTable table) throws Throwable {
	    // Express the Regexp above with the code you wish you had
	    // For automatic conversion, change DataTable to List<YourType>
	    throw new PendingException();
	}
}
