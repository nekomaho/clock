# frozen_string_literal: true
require 'curses'

class Console
  class << self
    def init
      Curses.init_screen
      Curses.start_color
      Curses.init_pair(1, Curses::COLOR_WHITE, Curses::COLOR_BLUE)
    end
  end
end
