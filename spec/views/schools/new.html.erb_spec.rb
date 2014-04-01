require 'spec_helper'

describe "schools/new" do
  before(:each) do
    assign(:school, stub_model(School,
      :type => "",
      :establishment => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new school form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", schools_path, "post" do
      assert_select "input#school_type[name=?]", "school[type]"
      assert_select "input#school_establishment[name=?]", "school[establishment]"
      assert_select "input#school_name[name=?]", "school[name]"
    end
  end
end
