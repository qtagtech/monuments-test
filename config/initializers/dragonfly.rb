require 'dragonfly'
require 'dragonfly/s3_data_store'
# Configure
Dragonfly.app.configure do
  #plugin :imagemagick

  secret "5b5976a78081e52fb15909bf1020136351ff9db2a4f5af7ff8c38404d83c688c"

  url_format "/media/:job/:name"
  if Rails.env.development? || Rails.env.test?

    datastore :file,
              root_path: Rails.root.join('public/system/dragonfly', Rails.env),
              server_root: Rails.root.join('public')

  else
    datastore :s3,
              bucket_name: 'monuments_jdah1',
              access_key_id: 'AKIAIX3MN6ONW3QG3GKQ',
              secret_access_key: '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',
              url_scheme: 'http'
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
