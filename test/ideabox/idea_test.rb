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
  include WithRollback

  def test_it_exists
    assert_equal 0, Idea.count
    temporarily do
      Idea.create(:description => 'A wonderful idea!')
      assert_equal 1, Idea.count
    end
    assert_equal 0, Idea.count
  end

end
