# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    title "MyString"
    content "MyText"
    sender_id 1
    recipient_id 1
    show_sender false
    show_recipient false
    read false
  end
end
