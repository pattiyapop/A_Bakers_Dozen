require 'spec_helper'

describe "recipes/new" do
  before(:each) do
    assign(:recipe, stub_model(Recipe,
      :name => "MyString",
      :picture => "MyString",
      :description => "MyText",
      :ingredients => "MyText",
      :instructions => "MyText"
    ).as_new_record)
  end

  it "renders new recipe form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", recipes_path, "post" do
      assert_select "input#recipe_name[name=?]", "recipe[name]"
      assert_select "input#recipe_picture[name=?]", "recipe[picture]"
      assert_select "textarea#recipe_description[name=?]", "recipe[description]"
      assert_select "textarea#recipe_ingredients[name=?]", "recipe[ingredients]"
      assert_select "textarea#recipe_instructions[name=?]", "recipe[instructions]"
    end
  end
end
