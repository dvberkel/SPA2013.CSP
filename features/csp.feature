Feature: Constraint Satisfaction Problem Solving
  In order to better understand Constraint Satisfaction Problems
  As a SPA 2013 attendee
  I want to test drive a Constraint Satisfaction Problem solver

  Scenario: One variable unconstrained
    Given I have a CSP problem
    And I have a variable 'X' with domain [0, 1, 2]
    When I solve the problem
    Then I expect solutions
    | X |
    | 0 |
    | 1 |
    | 2 |

  Scenario: Two variables unconstrained
    Given I have a CSP problem
    And I have a variable 'X' with domain [0, 1, 2]
    And I have a variable 'Y' with domain [0, 1]
    When I solve the problem
    Then I expect solutions
    | X | Y |
    | 0 | 0 |
    | 0 | 1 |
    | 1 | 0 |
    | 1 | 1 |
    | 2 | 0 |
    | 2 | 1 |

  Scenario: Two variables constrained for equality
    Given I have a CSP problem
    And I have a variable 'X' with domain [0, 1, 2]
    And I have a variable 'Y' with domain [0, 1]
    And I have a constraint: X = Y
    When I solve the problem
    Then I expect solutions
    | X | Y |
    | 0 | 0 |
    | 1 | 1 |

  Scenario: Two variables constrained for inequality
    Given I have a CSP problem
    And I have a variable 'X' with domain [0, 1, 2]
    And I have a variable 'Y' with domain [0, 1]
    And I have a constraint: X != Y
    When I solve the problem
    Then I expect solutions
    | X | Y |
    | 0 | 1 |
    | 1 | 0 |
    | 2 | 0 |
    | 2 | 1 |

  Scenario: Two variables constrained by equation
    Given I have a CSP problem
    And I have a variable 'X' with domain [0, 1, 2]
    And I have a variable 'Y' with domain [0, 1]
    And I have a constraint: X = Y + 1
    When I solve the problem
    Then I expect solutions
    | X | Y |
    | 1 | 0 |
    | 2 | 1 |
