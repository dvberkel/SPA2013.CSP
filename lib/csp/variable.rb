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
      candidates(@variables).each do |assignment|
        block.call(assignment)
      end
    end
  end
end

def candidates(variables)
  VariablesIterator.new(variables)
end

class VariablesIterator
  def initialize(variables)
    if (variables.size > 0)
      @variable = variables[0]
      @next = VariablesIterator.new(variables.slice(1, variables.size))
    else
      @variable = nil
    end
  end

  def each(&block)
    if @variable
      @variable.each do |head|
        @next.each do |tail|
          block.call(head.merge(tail))
        end
      end
    else
      block.call(Hash.new)
    end
  end
end
