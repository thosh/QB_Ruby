require 'quickbase_client'

qbc = QuickBase::Client.init({"username" => "", "password" => "",  "org" => "regencylighting"}) 
qbc.grantedDBs{|db|    puts "dbid: #{db.dbinfo.dbid}, dbname: #{db.dbinfo.dbname}" } 
