require 'test_helper'

class SimpleFlowTest < ActionDispatch::IntegrationTest
  test 'can create a recipe' do
    get '/recipes/new'
    assert_response :success

    post '/recipes',
         params: { recipe: { name: 'new name', description: 'new description' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'h1', 'new name'
  end
end
