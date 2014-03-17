
module SourceMatchers
  module RSpec

    class AbstractMatcher

      def initialize(word)
        @word = word
      end

      def matches?(source)
        # Due to scoping we need to assign local variables to our instance variables
        _module = @module
        _class = @class
        _class_method = @class_method
        _method = @method
        result = source

        result = result / Q?{ s(:module, _module, ___) } if _module
        result = result / Q?{ s(:class, _class, ___) } if _class
        result = result / Q?{ s(:defn, _method, ___) } if _method
        result = result / Q?{ s(:defs, s(:self), _class_method, ___) } if _class_method
        result = match_result(result)

        result.any?
      end

      # # # # # # # # #
      # Chain Methods #
      # # # # # # # # #

      def in(class_name)
        @class = class_name
        self
      end

      def for(module_name)
        @module = module_name
        self
      end

      def in_method(method_name)
        @method = method_name
        self
      end

      def in_class_method(class_name=nil, method_name)
        @class = class_name
        @class_method = method_name
        self
      end

      def construct_message
        msg += " in `#{@class}`" if @class
        msg += " in method `#{@method}`" if @method
        msg += " in class method `#{@class_method}`" if @class_method
        msg += " for #{@module}" if @module
        msg += " with exactly #{@line_count} line#{'s' if @line_count != 1}" if @line_count
        @msg = msg
      end
    end

  end
end
