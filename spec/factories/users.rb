FactoryGirl.define do

  factory :user do
    first_name "Bob"
    last_name "Smith"
    email "bob@email.com"
    password "password"
    password_confirmation "password"
  end

  factory :user_change, class: User, parent: :user do
    email "bob_smith@email.com"
  end

end