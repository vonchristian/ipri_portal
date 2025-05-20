# app/admin/db_backup.rb
require 'shellwords'
require 'tempfile'

ActiveAdmin.register_page "Database Backup" do
  page_action :download, method: :get do
    # Database config
    db_config = Rails.configuration.database_configuration[Rails.env]
    user     = db_config['username']
    host     = db_config['host']
    db_name  = db_config['database']
    password = db_config['password']

    # Use Tempfile for safe temp file handling
    temp_file = Tempfile.new(['db_backup', '.sql'])
    temp_path = temp_file.path
    temp_file.close # Close the file so pg_dump can write to it

    # Absolute path to pg_dump
    pg_dump_path = `which pg_dump`.strip
    raise "pg_dump not found" if pg_dump_path.empty?

    # Build shell-safe command
    command = [
      "PGPASSWORD=#{password.to_s.shellescape}",
      pg_dump_path.shellescape,
      '-U', user.to_s.shellescape,
      '-h', host.shellescape,
      '-f', temp_path.shellescape,
      db_name.shellescape
    ].join(' ')

    # Run the dump
    output = `#{command} 2>&1`
    raise "pg_dump failed:\n#{output}" unless File.exist?(temp_path) && $?.success?

    # Send file as response
    send_file temp_path,
              filename: "db_backup_#{Time.now.strftime('%Y%m%d_%H%M%S')}.sql",
              type: 'application/sql'

    # File will be auto-deleted after request (Tempfile behavior)
  end

  content do
    para "Click the button below to download a PostgreSQL database dump."

    div do
      # Correct URL generation inside Arbre context
      link_to "Download DB Dump", url_for(action: :download), class: "button"
    end
  end
end
