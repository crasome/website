FactoryGirl.define do
  factory :visitor, :class => OpenStruct do
    name "Bob"
    email "bob@example.com"

    factory :client, :class => OpenStruct do
      name "Dan"
      email "dan@example.com"
      company "Crasome"
    end

    factory :engineer, :class => OpenStruct do
      name "Jim"
      email "jim@example.com"
      occupation "Ruby engineer"
    end

    trait :invalid do
      email "@invalid_email@"
    end
  end

  factory :message, :class => OpenStruct do
    title "Hello!"
    content "Hello World!"
  end
end
