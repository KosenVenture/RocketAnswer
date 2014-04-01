require 'spec_helper'

describe "departments/show" do
  before(:each) do
    @department = assign(:department, stub_model(Department,
      :school => nil,
      :name => "Name",
      :kind => "Kind",
      :prefecture => "Prefecture",
      :address => "Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Name/)
    rendered.should match(/Kind/)
    rendered.should match(/Prefecture/)
    rendered.should match(/Address/)
  end
end
