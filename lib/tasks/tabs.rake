desc "Open up a bunch of Terminal tabs and start all the necessary processes to develop the app"
task :tabs do
  system("/usr/bin/osascript script/terminal_tabs.scpt " + Dir.pwd)
end
