require_relative 'runner/all'

module Kuromi
  class Runner

    def self.for(binary_name)
      Binary.new(binary_name)
    end
  end
end

