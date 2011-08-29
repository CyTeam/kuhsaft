require 'rails/generators'

module Kuhsaft
  module Install
    class Assets < Rails::Generators::Base
      source_root(Kuhsaft::Engine.root)
      def copy_assets
        directory 'app/assets/images/kuhsaft', 'app/assets/images/kuhsaft'
      end
    end
  end
end
