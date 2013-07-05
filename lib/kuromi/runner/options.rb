module Kuromi
  class Runner
    module Options
      def with(option, value=nil)
        OptionValue.new(self, option, value)
      end

      alias_method :and, :with
    end
  end
end
