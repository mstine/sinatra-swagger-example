task :default => [:swagger]

task :swagger do
  system 'bundle exec source2swagger -f app.rb -c "##~" -o public/api'
end

