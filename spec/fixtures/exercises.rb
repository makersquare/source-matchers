
module Getters

  class BoxA
    attr_reader :secret
    def initialize
      @secret = 50
    end
  end

  class BoxB
    def initialize
      @secret = 50
    end

    def secret
      @secret
    end
  end
end
