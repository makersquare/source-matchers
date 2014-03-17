
module SourceMatchers
  module RSpec

    def include_method(method_name)
      MethodMatcher.new(method_name)
    end

    class MethodMatcher < AbstractMatcher
      def match_result(source)
        method_name = @target
        source / Q?{ s(:defn, method_name, ___) }
      end

      def failure_message_for_should
        construct_message "expected your code to include the method `#{@target}`"
      end

      def failure_message_for_should_not
        construct_message "expected your code to not include the method `#{@target}`"
      end
    end

  end
end
