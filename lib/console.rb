# frozen_string_literal: true
require 'curses'
require_relative 'console/ascii_art'

class Console
  include AsciiArt

  class << self
    def init
      Curses.init_screen
      Curses.start_color
      Curses.noecho
      Curses.init_pair(1, Curses::COLOR_WHITE, Curses::COLOR_BLUE)
      Curses.init_pair(2, Curses::COLOR_BLUE, Curses::COLOR_WHITE)
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

  def set_str_as_ascii_art(start_x, start_y, str)
    x = start_x
    y = start_y

    str.chars.each do |c|
      bit_map = convert_ascii_ar_from_char(c)
      return if bit_map.nil?

      win.attron(Curses.color_pair(2))
      y.upto (y + CHAR_HEIGHT - 1)  do |offset_y|
        x.upto (x + CHAR_WIDTH - 1) do |offset_x|
          win.setpos(offset_y, offset_x)
          win << ' ' if bit_map[offset_y-y][offset_x-x] == 1
        end
      end
      x = x + CHAR_PADDING
    end
    win.setpos(0, 0)
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
