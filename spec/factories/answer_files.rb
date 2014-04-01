# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer_file do
    answer nil
    user nil
    image "MyString"
  end
end
