require 'open3'

module Kuromi
  class Runner
    module Runnable
      def run
        Open3.popen3(self.to_s) do |sin, sout, serr, thr|
          return Output.new(thr.value)
        end
      end
    end
  end
end
