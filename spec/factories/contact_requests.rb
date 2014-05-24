FactoryGirl.define do
  factory :visitor, :class => OpenStruct do
    name "Bob"
    email "bob@example.com"
  end

  factory :message, :class => OpenStruct do
    title "Hello!"
    content "Hello World!"
  end
end
