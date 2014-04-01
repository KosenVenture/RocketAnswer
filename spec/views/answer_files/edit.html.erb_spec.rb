require 'spec_helper'

describe "answer_files/edit" do
  before(:each) do
    @answer_file = assign(:answer_file, stub_model(AnswerFile,
      :answer => nil,
      :user => nil,
      :image => "MyString"
    ))
  end

  it "renders the edit answer_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", answer_file_path(@answer_file), "post" do
      assert_select "input#answer_file_answer[name=?]", "answer_file[answer]"
      assert_select "input#answer_file_user[name=?]", "answer_file[user]"
      assert_select "input#answer_file_image[name=?]", "answer_file[image]"
    end
  end
end
