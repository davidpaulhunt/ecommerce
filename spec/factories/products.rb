# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "Racecar"
    sku "1234567789"
    description "A wonderful racecar driven by Ricky Bobby himself! Without this sweet ride, he would have been nothing. It is your's today if you just act now. Do it! Buy it!"
    short_description "Ricky Bobby's racecar!"
    price 100000.00
  end
end
