require 'spec_helper'

describe "schools/index" do
  before(:each) do
    assign(:schools, [
      stub_model(School,
        :type => "Type",
        :establishment => "Establishment",
        :name => "Name"
      ),
      stub_model(School,
        :type => "Type",
        :establishment => "Establishment",
        :name => "Name"
      )
    ])
  end

  it "renders a list of schools" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Establishment".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
