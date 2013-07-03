module Kuromi
  class Runner
    class Output
      attr_reader :stdout, :code

      def initialize(code, stdout)
        @code = code
        @stdout = stdout
      end
    end
  end
end
