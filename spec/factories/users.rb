FactoryGirl.define do
  factory :user do
    id 1
    email "testuser@testuser.com"
    encrypted_password "foobar"
    password "foobar"
  end 
end
