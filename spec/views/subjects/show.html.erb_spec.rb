require 'spec_helper'

describe "subjects/show" do
  before(:each) do
    @subject = assign(:subject, stub_model(Subject,
      :department => nil,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Name/)
  end
end
