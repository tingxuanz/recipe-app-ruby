require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  test 'should not save recipe without name/description' do
    recipe = Recipe.new
    assert_not recipe.save
  end


end
