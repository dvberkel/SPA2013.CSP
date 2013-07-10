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
  end
end
