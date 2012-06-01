#!/usr/bin/osascript

on run argv     # the 'on run' is required to read argv, which in this case, is the curdir

  # setup the command to change dirs for each tab
  #
  set changeDir to "cd " & item 1 of argv & "; "

  # need to preseve those funky linebreak continuation characters
  # which is an OPTION-ENTER in the AppleScript Editor
  #
  # {"SOLR",          "rake sunspot:solr:run"}, ¬
  # {"REDIS",         "redis-server /usr/local/etc/redis.conf"}, ¬
  # /usr/local/etc/redis.conf <= this was the default location for redis.conf for me. You may need to edit this
  # {"RESQUE-WEB",    "resque-web"}, ¬
  # {"RESQUE WORKER", "rake environment resque:work QUEUES=development_urgent,development_general"}, ¬
  # {"JASMINE",       "rake jasmine"}, ¬
  # {"SPORK",         "spork"}, ¬
  # {"MEMCACHED",  "memcached"}, ¬
  # {"RESQ-SCHED", "rake resque:scheduler"}, ¬
  # {"TUNNEL",     "sudo rake tunnel"}, ¬
  # {"SOLR-TEST",  "rake sunspot:solr:run RAILS_ENV=test"}, ¬
  # {"MYSQL",      "script/dbconsole -p"}, ¬
  # {"BASH",       "rake resque:web"} ¬
  # {"AUTOTEST",      "autotest -cf"} ¬

  set tabs to {¬
    {"CONSOLE",       "rails console"}, ¬
    {"SERVER",        "rails server"} ¬
  }

  # tell application "Terminal"
  #   display dialog "It's a good idea to run any 'sudo' command first" buttons ["Cancel", "Already Did!"]
  # end tell

  repeat with tabinfo in tabs
    tell application "Terminal"
      activate
      set cmd to changeDir & item 2 of tabinfo
      tell application "System Events" to tell process "Terminal" to keystroke "tIa" using command down
      tell application "System Events" to tell process "Terminal" to keystroke item 1 of tabinfo
      tell application "System Events" to tell process "Terminal" to keystroke "w" using command down
      tell application "System Events" to tell process "Terminal" to keystroke cmd & return
    end tell
  end repeat

end run
