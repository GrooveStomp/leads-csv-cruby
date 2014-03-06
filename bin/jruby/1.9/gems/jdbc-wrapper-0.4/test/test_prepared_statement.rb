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
  
  def test_insert_and_select
    create_and_populate_records_table
    
    stmt = @db.prepare("INSERT INTO records (name,id) VALUES (?,?)")
    
    assert_equal(1, stmt.execute('bar', 2))
    
    stmt = @db.prepare("SELECT * FROM records where id = ?")
    
    row = stmt.execute(2).fetch
    
    assert_equal('bar', row[0])
    assert_equal(2, row[1])
    
    stmt.close
  end
  
  def test_runtime_error_on_invalid_arg_count
    create_and_populate_records_table
    
    stmt = @db.prepare("SELECT * FROM records WHERE name = ?")
    
    begin
      stmt.execute('arg1','bad_arg2')
      flunk
    rescue RuntimeError => e
      assert_equal("Got 2 params, expected 1.", e.message)
    end
    
    stmt.close
  end
  
  def create_and_populate_records_table
    @db.query("CREATE TABLE records (name VARCHAR(80), id INT)")
  end
end