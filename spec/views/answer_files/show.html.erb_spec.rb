require 'spec_helper'

describe "answer_files/show" do
  before(:each) do
    @answer_file = assign(:answer_file, stub_model(AnswerFile,
      :answer => nil,
      :user => nil,
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Image/)
  end
end
