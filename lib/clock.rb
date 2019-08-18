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
    console.display
    console.quit_console
  end
end
