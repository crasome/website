FactoryGirl.define do
  factory :visitor, :class => Contact::Visitor do
    name "Bob"
    email "bob@example.com"

    factory :engineer, :class => Contact::Engineer do
      name "Jim"
      email "jim@example.com"
      position "Ruby engineer"
    end

    trait :invalid do
      email "invalid@email"
    end
  end

  factory :message, :class => Contact::Message do
    title "Hello!"
    content "Hello World!"
  end

  factory :company, :class => Contact::Company do
    name "Crasome"
    email "info@crasome.com"
  end
end
