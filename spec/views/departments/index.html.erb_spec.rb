require 'spec_helper'

describe "departments/index" do
  before(:each) do
    assign(:departments, [
      stub_model(Department,
        :school => nil,
        :name => "Name",
        :kind => "Kind",
        :prefecture => "Prefecture",
        :address => "Address"
      ),
      stub_model(Department,
        :school => nil,
        :name => "Name",
        :kind => "Kind",
        :prefecture => "Prefecture",
        :address => "Address"
      )
    ])
  end

  it "renders a list of departments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Kind".to_s, :count => 2
    assert_select "tr>td", :text => "Prefecture".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
  end
end
