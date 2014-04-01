require 'spec_helper'

describe "answer_files/index" do
  before(:each) do
    assign(:answer_files, [
      stub_model(AnswerFile,
        :answer => nil,
        :user => nil,
        :image => "Image"
      ),
      stub_model(AnswerFile,
        :answer => nil,
        :user => nil,
        :image => "Image"
      )
    ])
  end

  it "renders a list of answer_files" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
