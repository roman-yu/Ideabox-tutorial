require './test/test_helper'

class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :description
    end
  end
end

begin
	CreateIdeas.new.change
rescue ActiveRecord::StatementInvalid
end

class IdeaTest < MiniTest::Unit::TestCase

  def test_it_exists
    idea = Idea.new(:description => 'A wonderful idea!')
    assert_equal 'A wonderful idea!', idea.description
  end

end