FactoryGirl.define do
  factory :visitor, :class => OpenStruct do
    name "Bob"
    email "bob@example.com"
  end

  factory :engineer, :class => OpenStruct do
    name "Jim"
    email "jim@example.com"
    occupation "Ruby engineer"
  end

  factory :message, :class => OpenStruct do
    title "Hello!"
    content "Hello World!"
  end
end
