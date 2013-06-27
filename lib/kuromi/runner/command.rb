module Kuromi
  class Runner
    class Command
      include Runnable
      include Options

      def initialize(binary, command)
        @binary = binary
        @command = command
      end

      def to_s
        "#{binary} #{command}"
      end

      private

      attr_reader :binary, :command
    end
  end
end
