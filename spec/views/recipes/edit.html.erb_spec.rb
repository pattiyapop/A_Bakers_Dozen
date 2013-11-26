require 'spec_helper'

describe "recipes/edit" do
  before(:each) do
    @recipe = assign(:recipe, stub_model(Recipe,
      :name => "MyString",
      :picture => "MyString",
      :description => "MyText",
      :ingredients => "MyText",
      :instructions => "MyText"
    ))
  end

  it "renders the edit recipe form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", recipe_path(@recipe), "post" do
      assert_select "input#recipe_name[name=?]", "recipe[name]"
      assert_select "input#recipe_picture[name=?]", "recipe[picture]"
      assert_select "textarea#recipe_description[name=?]", "recipe[description]"
      assert_select "textarea#recipe_ingredients[name=?]", "recipe[ingredients]"
      assert_select "textarea#recipe_instructions[name=?]", "recipe[instructions]"
    end
  end
end
