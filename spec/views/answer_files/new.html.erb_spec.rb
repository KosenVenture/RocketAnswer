require 'spec_helper'

describe "answer_files/new" do
  before(:each) do
    assign(:answer_file, stub_model(AnswerFile,
      :answer => nil,
      :user => nil,
      :image => "MyString"
    ).as_new_record)
  end

  it "renders new answer_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", answer_files_path, "post" do
      assert_select "input#answer_file_answer[name=?]", "answer_file[answer]"
      assert_select "input#answer_file_user[name=?]", "answer_file[user]"
      assert_select "input#answer_file_image[name=?]", "answer_file[image]"
    end
  end
end
