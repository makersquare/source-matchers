
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

  class BoxC
    def open
    end
  end

  class BoxD
    def close
      :bam!
    end
  end
end

module Setters
  class ChairA
  end
end

module Misc
  class MyRandom
    def self.roll_dice
      rand(6) + 1
    end

    def self.roll_two_dice
      dice1 = self.roll_dice
      dice2 = self.roll_dice
      [dice1, dice2]
    end
  end

  class BopIt
    def self.bop
      sound = 'bop'
    end
  end
end
