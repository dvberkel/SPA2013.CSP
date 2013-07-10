module CSP
  class Problem
    def initialize
      @variables = []
    end

    def addVariable(variable)
      @variables << variable
    end
  end
end
