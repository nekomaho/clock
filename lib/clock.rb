# frozen_string_literal: true

require_relative 'console'
require 'time'

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

    key_thread = Thread.new &method(:key_loop)
    Thread.new &method(:timer_loop)
    key_thread.join

    console.quit_console
  end

  def key_loop
    loop do
      string = console.get_line
      break if string == 'quit'
    end
  end

  def timer_loop
    loop do
      sleep(0.2)
      time = Time.now
      yyyymmdd_str = time.strftime('%Y %m %d %T')
      console.set_background_color
      console.set_str_as_ascii_art(console.width/2 - (yyyymmdd_str.length * 4)/2, console.height/2, yyyymmdd_str)
      console.display
    end
  end
end
