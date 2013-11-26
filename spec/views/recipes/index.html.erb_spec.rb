require 'spec_helper'

describe "recipes/index" do
  before(:each) do
    assign(:recipes, [
      stub_model(Recipe,
        :name => "Name",
        :picture => "Picture",
        :description => "MyText",
        :ingredients => "MyText",
        :instructions => "MyText",
        :user_id => 1
      ),
      stub_model(Recipe,
        :name => "Name",
        :picture => "Picture",
        :description => "MyText",
        :ingredients => "MyText",
        :instructions => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of recipes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
