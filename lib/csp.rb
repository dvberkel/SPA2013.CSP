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

  def self.not_equal(left, right)
    CSP::Constraint::Not_Equal.new(left, right)
  end

  def self.valueOf(key)
    Proc.new { |candidate| candidate[key] }
  end
end
