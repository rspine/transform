module Spine
  module Transform
    class Mapping
      include Syntax::Copy
      include Syntax::Transform
      include Syntax::Integer
      include Syntax::Decimal
      include Syntax::Boolean
      include Syntax::Date
      include Syntax::Timestamp

      attr_reader :commands

      def initialize(dsl)
        @dsl = dsl
      end

      def commands
        @commands ||= {}
      end

      def for(key)
        commands[key] || Commands::Null
      end

      def parse
        instance_eval &@dsl
      end

      private

      def register(key, command)
        commands[key] = command
        command
      end

      def intercept(key, options = {}, &block)
        Commands::Intercept.new(key, block, options)
      end
    end
  end
end
