# frozen_string_literal: true

require_relative 'console'

class Clock
  class << self
    def start
      new
    end
  end

  def initialize
    Console.init
  end
end
