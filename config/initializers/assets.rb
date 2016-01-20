# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
#JS
Rails.application.config.assets.precompile += %w( homepage.js )


#CSS
Rails.application.config.assets.precompile += %w( homepage.css )
Rails.application.config.assets.precompile += %w( card.css )
Rails.application.config.assets.precompile += %w( global.css )
Rails.application.config.assets.precompile += %w( header.css )
Rails.application.config.assets.precompile += %w( material-click.css )
Rails.application.config.assets.precompile += %w( paginations.css )
Rails.application.config.assets.precompile += %w( card-small.css )
Rails.application.config.assets.precompile += %w( card-big.css )