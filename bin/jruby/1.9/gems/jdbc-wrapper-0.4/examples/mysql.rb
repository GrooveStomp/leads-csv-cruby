$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'jdbc'

JDBC::DB.start(:mysql,"localhost","3306","root","root","tasks_dev") do |db|
  db.query("select * from jobs limit 1").each do |row|
    row.each { |v| puts v }
    puts
  end

  db.query("select * from jobs limit 1").each_hash do |row|
    row.each { |k,v| puts "#{k} = #{v}, #{v.class}" }
    puts
  end
end
