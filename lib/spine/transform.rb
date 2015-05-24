module Spine
  module Transform
    autoload :Definition, 'spine/transform/definition'
    autoload :Transformer, 'spine/transform/transformer'
    autoload :Mapping, 'spine/transform/mapping'

    module Syntax
      autoload :Copy, 'spine/transform/syntax/copy'
      autoload :Transform, 'spine/transform/syntax/transform'
      autoload :Integer, 'spine/transform/syntax/integer'
      autoload :Decimal, 'spine/transform/syntax/decimal'
      autoload :Boolean, 'spine/transform/syntax/boolean'
      autoload :Date, 'spine/transform/syntax/date'
      autoload :Timestamp, 'spine/transform/syntax/timestamp'
    end

    module Commands
      autoload :Null, 'spine/transform/commands/null'
      autoload :Copy, 'spine/transform/commands/copy'
      autoload :Transform, 'spine/transform/commands/transform'
      autoload :Intercept, 'spine/transform/commands/intercept'
    end

    extend Definition
  end
end
