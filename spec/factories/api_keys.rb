FactoryBot.define do
  factory :api_key do
    access_token { "MyString" }
    expires_at { "2019-09-15 14:18:08" }
    user_id { 1 }
  end
end
