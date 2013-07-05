module Kuromi
  class Runner
    class OptionValue
      include Runnable
      include Options

      def initialize(binary, option, value)
        @binary = binary
        @option = option
        @value = value
      end

      def to_s
        "#{binary} #{option} #{value}".strip
      end

      private

      attr_reader :binary, :option, :value
    end
  end
end
