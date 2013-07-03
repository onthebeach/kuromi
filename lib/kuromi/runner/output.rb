module Kuromi
  class Runner
    class Output
      attr_reader :stdout, :stderr, :code

      def initialize(code, stdout, stderr)
        @code = code
        @stdout = stdout
        @stderr = stderr
      end
    end
  end
end
