require 'spec_helper'

describe "departments/new" do
  before(:each) do
    assign(:department, stub_model(Department,
      :school => nil,
      :name => "MyString",
      :kind => "MyString",
      :prefecture => "MyString",
      :address => "MyString"
    ).as_new_record)
  end

  it "renders new department form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", departments_path, "post" do
      assert_select "input#department_school[name=?]", "department[school]"
      assert_select "input#department_name[name=?]", "department[name]"
      assert_select "input#department_kind[name=?]", "department[kind]"
      assert_select "input#department_prefecture[name=?]", "department[prefecture]"
      assert_select "input#department_address[name=?]", "department[address]"
    end
  end
end
