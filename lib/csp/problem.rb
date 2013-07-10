require 'csp/variable'

module CSP
  class Problem
    def initialize
      @variables = CSP::Variables.new
    end

    def addVariable(variable)
      @variables << variable
    end

    def solve(&block)
      @variables.each do |candidate|
        block.call(candidate)
      end
    end
  end
end
