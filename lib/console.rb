# frozen_string_literal: true
require 'curses'

class Console
  class << self
    def init
      Curses.init_screen
      Curses.start_color
      Curses.init_pair(1, Curses::COLOR_WHITE, Curses::COLOR_BLUE)
      new
    end
  end

  attr_reader :win

  def make_window
    @win = Curses::Window.new(Curses.lines, Curses.cols, 0, 0)
  end

  def quit_console
    win.close
  end

  def display
    win.refresh
  end
end
