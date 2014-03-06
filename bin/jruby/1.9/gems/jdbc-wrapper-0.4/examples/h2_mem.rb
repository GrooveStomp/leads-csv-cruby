$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'jdbc'

JDBC::DB.start(:h2_mem,nil,nil,nil,nil,'foo') do |db|
  db.query("CREATE TABLE records " + 
    "(name VARCHAR(80), created_on TIMESTAMP)")
    
  db.query("INSERT INTO records (name, created_on) " + 
    "VALUES ('foo', '#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}')")
  
  db.query("SELECT * FROM records").each_hash do |row|
    row.each { |k,v| puts "#{k} = #{v}" }
  end
end

