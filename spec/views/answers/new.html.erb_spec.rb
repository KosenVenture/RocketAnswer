require 'spec_helper'

describe "answers/new" do
  before(:each) do
    assign(:answer, stub_model(Answer,
      :subject => nil,
      :user => nil,
      :year => 1
    ).as_new_record)
  end

  it "renders new answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", answers_path, "post" do
      assert_select "input#answer_subject[name=?]", "answer[subject]"
      assert_select "input#answer_user[name=?]", "answer[user]"
      assert_select "input#answer_year[name=?]", "answer[year]"
    end
  end
end
