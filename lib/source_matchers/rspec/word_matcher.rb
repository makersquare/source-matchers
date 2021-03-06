
module SourceMatchers
  module RSpec

    def include_code(word)
      WordMatcher.new(word)
    end

    class WordMatcher < AbstractMatcher
      def match_result(source)
        word = @target
        source / Q?{ include(word) }
      end

      def failure_message_for_should
        construct_message "expected your code to include `#{@target}`"
      end

      def failure_message_for_should_not
        construct_message "expected your code to not include `#{@target}`"
      end
    end

  end
end