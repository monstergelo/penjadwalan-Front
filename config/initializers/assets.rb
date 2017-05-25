# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
#css
Rails.application.config.assets.precompile += %w( dhtmlxscheduler.css )
Rails.application.config.assets.precompile += %w( datepicker.css )
Rails.application.config.assets.precompile += %w( grimps.css )
Rails.application.config.assets.precompile += %w( material.min.css )
Rails.application.config.assets.precompile += %w( materialize.css )
Rails.application.config.assets.precompile += %w( materialize.min.css )
Rails.application.config.assets.precompile += %w( styles.css )

Rails.application.config.assets.precompile += %w( dhtmlxscheduler_flat.css )

#js
Rails.application.config.assets.precompile += %w( dhtmlxscheduler.js )
Rails.application.config.assets.precompile += %w( dhtmlxcalendar.js )
Rails.application.config.assets.precompile += %w( add-schedule.js )
Rails.application.config.assets.precompile += %w( calendar.js )
Rails.application.config.assets.precompile += %w( material.min.js )
Rails.application.config.assets.precompile += %w( first-page.js )
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( login.js )
Rails.application.config.assets.precompile += %w( materialize.js )
Rails.application.config.assets.precompile += %w( materialize.min.js )
Rails.application.config.assets.precompile += %w( datepicker.js )
Rails.application.config.assets.precompile += %w( dhtmlxscheduler_agenda_view.js )
Rails.application.config.assets.precompile += %w( dhtmlxscheduler_editors.js )
Rails.application.config.assets.precompile += %w( dhtmlxscheduler_minical.js )
Rails.application.config.assets.precompile += %w( jadwalsidang.js )
Rails.application.config.assets.precompile += %w( loadcalendar.js )
Rails.application.config.assets.precompile += %w( material.min_old.js )
Rails.application.config.assets.precompile += %w( notes.js )
Rails.application.config.assets.precompile += %w( pdfobject.min.js )
Rails.application.config.assets.precompile += %w( students.js )
Rails.application.config.assets.precompile += %w( verification.js )
Rails.application.config.assets.precompile += %w( verify.js )
Rails.application.config.assets.precompile += %w( fullname.js )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
