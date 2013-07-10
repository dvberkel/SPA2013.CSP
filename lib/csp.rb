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
    if key.include?('+')
      data = /(?<key>\w+)\s*\+\s*(?<shift>\d+)/.match(key)
      key = data[:key]
      shift = data[:shift].to_i
      Proc.new { |candidate| (candidate[key].to_i + shift).to_s }
    else
      Proc.new { |candidate| candidate[key] }
    end
  end
end
