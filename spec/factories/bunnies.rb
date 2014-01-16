# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bunny do
    name "MyString"
    status "MyString"
    age 1
    desc "MyText"
    temperment "MyString"
  end
end
