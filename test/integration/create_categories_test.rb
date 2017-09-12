require 'test_helper'
require 'rails-controller-testing'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  test "create new category form and create category " do
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