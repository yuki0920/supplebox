require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Supplebox
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    
    #不要ファイルを作成しないよう設定を追加
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
      g.skip_routes true
      g.test_framework false
    end
    
    # 日本語ファイルを読み込み
    config.i18n.default_locale = :ja
      
  end
end
