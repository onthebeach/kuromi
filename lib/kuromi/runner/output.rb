module Kuromi
  class Runner
    class Output
      attr_reader :stdout, :stderr, :code

      def initialize(code, stdout, stderr)
        @code = code
        @stdout = Option[stdout]
        @stderr = Option[stderr]
      end

      def success?
        @code == 0
      end
    end
  end
end
