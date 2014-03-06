$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'fileutils'
require 'jdbc'

db_path = File.join(File.dirname(__FILE__),'..','derby-example')

JDBC::DB.start(:derby,nil,nil,nil,nil,db_path) do |db|
  db.query("CREATE TABLE records " + 
    "(name VARCHAR(80), created_on TIMESTAMP)")
    
  db.query("INSERT INTO records (name, created_on) " + 
    "VALUES ('foo', '#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}')")
  
  db.query("SELECT * FROM records").each_hash do |row|
    puts row
  end
end

FileUtils.rm_r(db_path, :force => true) if File.exist?(db_path)
FileUtils.rm("derby.log") if File.exist?("derby.log")
