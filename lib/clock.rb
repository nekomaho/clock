# frozen_string_literal: true

require_relative 'console'

class Clock
  class << self
    def start
      new.exec
    end
  end

  attr_reader :console

  def initialize
    @console = Console.init
  end

  def exec
    console.make_window
    console.set_background_color
    console.display

    t = Thread.new &method(:key_loop)
    t.join

    console.quit_console
  end

  def key_loop
    loop do
      string = console.get_line
      break if string == 'quit'
    end
  end
end
