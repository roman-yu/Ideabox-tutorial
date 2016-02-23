require './test/test_helper'

class DBConfigTest < MiniTest::Unit::TestCase
  def test_default_file
    file = './config/database.yml'
    assert_equal file, DBConfig.new('env').file
  end

  def test_override_file
    file = './test/fixtures/database.yml'
    assert_equal file, DBConfig.new('env', file).file
  end

  def test_read_environment_specific_values
    config = DBConfig.new('fake', './test/fixtures/database.yml')
    options = {
      'adapter' => 'sqlite3',
      'database' => 'db/ideabox_fake'
    }
    assert_equal options, config.options
  end
end
