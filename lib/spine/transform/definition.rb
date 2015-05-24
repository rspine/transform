module Spine
  module Transform
    module Definition
      def define(&block)
        Transformer.new(block)
      end
    end
  end
end
