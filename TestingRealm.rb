require 'quickbase_client'

qbc = QuickBase::Client.init({"username" => "tom.shannon@regencylighting.com", "password" => "R3g3ncy.c0m",  "org" => "regencylighting"}) 
qbc.grantedDBs{|db|    puts "dbid: #{db.dbinfo.dbid}, dbname: #{db.dbinfo.dbname}" } 