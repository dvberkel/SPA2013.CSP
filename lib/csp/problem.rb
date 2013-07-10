module CSP
  class Problem
    def initialize
      @variables = []
    end

    def addVariable(variable)
      @variables << variable
    end

    def solve(&block)
    end
  end
end
