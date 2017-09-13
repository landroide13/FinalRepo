require 'test_helper'
#require 'rails-controller-testing'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup 
    @user = User.create(username:"john2", email:"john2@vn.com", password:"2222", admin: true)
  end

  test "create new category form and create category " do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: {name: "sports"}}
      follow_redirect!
    end 
    assert_template 'categories/index'
    assert_match 'sports', response.body
  end  

  test "invaild category submission result in failure " do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params: {category: {name: " "}}
    end
    assert_template 'categories/new'
    assert_select 'h2'
    assert_select 'p.mb-0'
  end

end