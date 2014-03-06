$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'jdbc'

class TestDB < Test::Unit::TestCase 
  def setup    
    @db = JDBC::DB.new(:h2,nil,nil,nil,nil,'test')
  end
  
  def teardown
    @db.close
  end
  
  def test_create_table
    assert_equal(0, create_records_table)
  end
  
  def test_insert_and_select
    create_records_table
    
    count = @db.query("INSERT INTO records (name) VALUES ('foo')")
    
    assert_equal(1, count)
    
    result = @db.query("SELECT * FROM records").fetch
    
    assert_equal('foo', result[0])
    
    result = @db.query("SELECT * FROM records").fetch_hash
    
    assert_equal('foo', result['name'])
  end
  
  def create_records_table
    @db.query("CREATE TABLE records (name VARCHAR(80))")
  end
end
