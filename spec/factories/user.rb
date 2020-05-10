FactoryBot.define do
  factory :user do
    email {Faker::Internet.email} 
    password {"123456"}
    password_confirmation {"123456"}
    first_name {"Firstname"} 
    last_name {"Lastname"}
  end

  factory :admin_user, class: "AdminUser" do
    email {Faker::Internet.email} 
    password {"123456"}
    password_confirmation {"123456"}
    first_name {"Firstname"} 
    last_name {"Lastname"}
  end

end