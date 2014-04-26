# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offer do
    user_id 1
    tender_id 1
    message "MyText"
  end
end
