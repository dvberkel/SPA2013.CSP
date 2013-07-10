module CSP
  class VariableBuilder
    def initialize(name)
      @name = name
    end

    def withDomain(domain)
      CSP::Variable.new(@name, domain)
    end
  end
end

module CSP
  class Variable
    def initialize(name, domain)
      @name = name
      @domain = domain
    end

    def each(&block)
      @domain.each do |value|
        block.call({ @name => value })
      end
    end
  end
end

module CSP
  class Variables
    def initialize
      @variables = []
    end

    def <<(variable)
      @variables << variable
    end

    def each(&block)
      @variables[0].each do |assignment|
        block.call(assignment)
      end
    end
  end
end
