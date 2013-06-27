module Kuromi
  class Runner
    class Binary
      include Runnable
      include Options

      def initialize(name)
        @name = name
      end

      def command(com)
        Command.new(self, com)
      end

      def to_s
        name
      end

      private

      attr_reader :name
    end
  end
end
