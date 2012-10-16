# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    date "2012-10-16"
    location "MyString"
    description "MyText"
  end
end
