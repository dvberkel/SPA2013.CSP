require 'csp/variable'

module CSP
  class Problem
    def initialize
      @variables = CSP::Variables.new
      @constraints = CSP::Constraints.new
    end

    def addVariable(variable)
      @variables << variable
    end

    def addConstraint(constraint)
      @constraints << constraint
    end

    def solve(&block)
      @variables.each do |candidate|
        if @constraints.satisfied_by?(candidate)
          block.call(candidate)
        end
      end
    end
  end
end
