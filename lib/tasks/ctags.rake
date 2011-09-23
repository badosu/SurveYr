desc "Run ctags on current project and gems dir"
task :ctags do
  %x{ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*}
end
