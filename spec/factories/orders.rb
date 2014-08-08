# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    first_name "Bob"
    last_name "Smith"
    billing_address1 "123 Fake St"
    billing_city "Grovetown"
    billing_state "GA"
    billing_zipcode "30813"
    # association :billing_country, :factory => :us
    email_address "bob@email.com"
    notes "Beware of dog."
    amount_paid 20.00
  end
end
