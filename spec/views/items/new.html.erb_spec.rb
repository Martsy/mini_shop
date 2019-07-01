require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :name => "MyString",
      :description => "MyText",
      :price => "9.99",
      :image => "MyString",
      :status => false,
      :inventory => 1,
      :merchant => nil
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[name]"

      assert_select "textarea[name=?]", "item[description]"

      assert_select "input[name=?]", "item[price]"

      assert_select "input[name=?]", "item[image]"

      assert_select "input[name=?]", "item[status]"

      assert_select "input[name=?]", "item[inventory]"

      assert_select "input[name=?]", "item[merchant_id]"
    end
  end
end
