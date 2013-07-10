require 'csp/problem'
require 'csp/variable'

module CSP
  def self.problem
    CSP::Problem.new
  end

  def self.variable(name)
    CSP::VariableBuilder.new(name)
  end
end
