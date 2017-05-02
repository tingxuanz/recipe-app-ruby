require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest

  #test for index action
  test 'should get index' do
    get recipes_url
    assert_equal 'index', @controller.action_name
    assert_select 'h1', 'Recipes'
  end

  #test for show action
  test 'should show a recipe' do
    recipe = recipes(:one)
    get recipe_url(recipe)
    assert_equal 'show', @controller.action_name
    assert_select 'h1', 'MyString'
  end

  #test for new and create actions
  test 'should create a new recipe' do
    assert_difference('Recipe.count') do
      post recipes_url, params: { recipe: { name: 'test', description: 'test' } }
    end

    assert_redirected_to recipe_path(Recipe.last)
    assert_equal 'A new recipe was created', flash[:notice]
  end

  #test for update action
  test 'should update a recipe' do
    recipe = recipes(:one)

    patch recipe_url(recipe), params: { recipe: { name: 'updated name', description: 'updated description' } }

    assert_redirected_to recipe_path(recipe)
    # Reload association to fetch updated data and assert that title is updated.
    recipe.reload
    assert_equal 'updated name', recipe.name
    assert_equal 'updated description', recipe.description
  end

  #test for destroy action
  test 'should destroy a recipe' do
    recipe = recipes(:one)
    assert_difference('Recipe.count', -1) do
      delete recipe_url(recipe)
    end

    assert_redirected_to recipes_path
    assert_equal 'A recipe was deleted', flash[:notice]
  end

end
