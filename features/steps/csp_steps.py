from lettuce import step

@step(u'Given I have a CSP problem')
def given_i_have_a_csp_problem(step):
    assert False, 'This step must be implemented'

@step(u'And I have a variable \'([^\']*)\' with domain \[([^\]]*)\]')
def and_i_have_a_variable_group1_with_domain_0_1_2(step, variable, domain):
    assert False, 'This step must be implemented'

@step(u'And I have a constraint: (.*)')
def and_i_have_a_constraint_x_y(step, constraint):
    assert False, 'This step must be implemented'

@step(u'When I solve the problem')
def when_i_solve_the_problem(step):
    assert False, 'This step must be implemented'

@step(u'Then I expect solutions')
def then_i_expect_solutions(step):
    assert False, 'This step must be implemented'
