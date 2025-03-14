if Rails.env.production?
  tailwindcss_binary_path = File.join(Rails.root, 'vendor', 'bundle', 'ruby', '3.4.0', 'gems', 'tailwindcss-ruby-3.4.17', 'exe', 'tailwindcss')
  ENV['TAILWINDCSS_BINARY'] = tailwindcss_binary_path if File.exist?(tailwindcss_binary_path)
end
