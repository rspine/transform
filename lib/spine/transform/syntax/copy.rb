module Spine
  module Transform
    module Syntax
      module Copy
        def copy(key, options = {})
          register(key, Commands::Copy.new(key, options))
        end
      end
    end
  end
end
