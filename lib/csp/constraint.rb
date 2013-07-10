module CSP
  module Constraint
    class Equal
      def initialize(left, right)
        @left = left
        @right = right
      end

      def satisfied_by?(candidate)
        candidate[@left] == candidate[@right]
      end
    end
  end
end

module CSP
  module Constraint
    class Not_Equal
      def initialize(left, right)
        @left = left
        @right = right
      end

      def satisfied_by?(candidate)
        candidate[@left] != candidate[@right]
      end
    end
  end
end

module CSP
  class Constraints
    def initialize
      @constraints = []
    end

    def <<(element)
      @constraints << element
    end

    def satisfied_by?(candidate)
      @constraints.all? { |constraint| constraint.satisfied_by?(candidate) }
    end
  end
end
