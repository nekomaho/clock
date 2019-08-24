# frozen_string_literal: true

module AsciiArt
  CHAR_WIDTH = 3
  CHAR_HEIGHT = 5
  CHAR_PADDING = CHAR_WIDTH + 1

  SPACE = [[0,0,0],
           [0,0,0],
           [0,0,0],
           [0,0,0],
           [0,0,0]].freeze

  ZERO =  [[1,1,1],
           [1,0,1],
           [1,0,1],
           [1,0,1],
           [1,1,1]].freeze

  ONE =   [[1,1,0],
           [0,1,0],
           [0,1,0],
           [0,1,0],
           [1,1,1]].freeze

  TWO  =  [[1,1,1],
           [0,0,1],
           [1,1,1],
           [1,0,0],
           [1,1,1]].freeze

  THREE = [[1,1,1],
           [0,0,1],
           [1,1,1],
           [0,0,1],
           [1,1,1]].freeze

  FOUR  = [[1,0,1],
           [1,0,1],
           [1,1,1],
           [0,0,1],
           [0,0,1]].freeze

  FIVE  = [[1,1,1],
           [1,0,0],
           [1,1,1],
           [0,0,1],
           [1,1,1]].freeze

  SIX   = [[1,1,1],
           [1,0,0],
           [1,1,1],
           [1,0,1],
           [1,1,1]].freeze

  SEVEN = [[1,1,1],
           [0,0,1],
           [0,0,1],
           [0,0,1],
           [0,0,1]].freeze

  EIGHT = [[1,1,1],
           [1,0,1],
           [1,1,1],
           [1,0,1],
           [1,1,1]].freeze

  NINE  = [[1,1,1],
           [1,0,1],
           [1,1,1],
           [0,0,1],
           [0,0,1]].freeze

  COLON = [[0,1,0],
           [0,1,0],
           [0,0,0],
           [0,1,0],
           [0,1,0]].freeze

  ASCII_MAP = { '0': ZERO,
                '1': ONE,
                '2': TWO,
                '3': THREE,
                '4': FOUR,
                '5': FIVE,
                '6': SIX,
                '7': SEVEN,
                '8': EIGHT,
                '9': NINE,
                ':': COLON,
                ' ': SPACE,
  }.freeze

  def convert_ascii_ar_from_char(c)
    ASCII_MAP[c.to_sym]
  end
end
