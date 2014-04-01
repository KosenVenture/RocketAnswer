# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    nickname "MyString"
    email "MyString"
    school nil
    department nil
    graduate_year 1
  end
end
