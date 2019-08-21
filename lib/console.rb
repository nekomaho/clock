# frozen_string_literal: true
require 'curses'

class Console
  class << self
    def init
      Curses.init_screen
      Curses.start_color
      Curses.noecho
      Curses.init_pair(1, Curses::COLOR_WHITE, Curses::COLOR_BLUE)
      new
    end
  end

  attr_reader :win, :width, :height

  def make_window
    @win = Curses::Window.new(Curses.lines, Curses.cols, 0, 0).tap do |win|
      @width = win.maxx
      @height = win.maxy
    end
  end

  def set_background_color
    win.attron(Curses.color_pair(1))

    win.maxy.times do |line|
      win.setpos(line, 0)
      win << ' ' * win.maxx
    end
  end

  def set_str(x, y, str)
    win.setpos(y, x)
    win.addstr(str)
  end

  def quit_console
    win.close
  end

  def display
    win.refresh
  end

  def get_line
    win.getstr
  end
end
