require 'csp/problem'
require 'csp/variable'
require 'csp/constraint'

module CSP
  def self.problem
    CSP::Problem.new
  end

  def self.variable(name)
    CSP::VariableBuilder.new(name)
  end

  def self.equal(left, right)
    CSP::Constraint::Equal.new(left, right)
  end
end
