FactoryBot.define do
  factory :user do
    first_name 'John'
    last_name  'Doe'
    email 'example@domain.com'
    password 'some_random_password'
  end

  factory :loan do
    name 'The Lone Lemon'
    amount  5500
    down_payment 500
    apr 0.045
    payments_per_year 12
    lifespan 5
    user
  end
end
