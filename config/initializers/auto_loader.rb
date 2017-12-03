paths = %w(
  config/initializers/*.rb
  app/**/*.rb
).map(&:freeze).freeze

paths.each do |path|
  Dir[File.join(App.root, path)].each do |file|
    next if file.include?('initializers/auto_loader') # Don't load itself
    require file
  end
end
