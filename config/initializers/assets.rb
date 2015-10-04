# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( homepage.css )
Rails.application.config.assets.precompile += %w( homepage.js )
Rails.application.config.assets.precompile += %w( manager.css )
Rails.application.config.assets.precompile += %w( public.css )
Rails.application.config.assets.precompile += %w( box.js )
Rails.application.config.assets.precompile += %w( box.css )
Rails.application.config.assets.precompile += %w( like_buttons.js )
Rails.application.config.assets.precompile += %w( idea.js )
Rails.application.config.assets.precompile += %w( idea.css )
Rails.application.config.assets.precompile += %w( list.min.js )
Rails.application.config.assets.precompile += %w( list.pagination.min.js )
Rails.application.config.assets.precompile += %w( manager.js )
Rails.application.config.assets.precompile += %w( homeone.css )
Rails.application.config.assets.precompile += %w( imagesloaded.pkgd.min.js )
Rails.application.config.assets.precompile += %w( jquery-imagefill.js )

# Icons fonts
Rails.application.config.assets.precompile += %w( flaticon.eot )
Rails.application.config.assets.precompile += %w( flaticon.woff )
Rails.application.config.assets.precompile += %w( flaticon.ttf )
Rails.application.config.assets.precompile += %w( flaticon.svg )
