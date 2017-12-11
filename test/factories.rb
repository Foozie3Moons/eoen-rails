FactoryBot.define do
  factory :user do
    first_name 'John'
    last_name  'Doe'
    email 'example@domain.com'
    password_digest 'some_random_password'
    initialize_with { new(attributes) }
  end

  factory :loan do
    name 'The Lone Lemon'
    amount  999999
    down_payment 99999
    apr 0.035
    payments_per_year 12
    lifespan 30
    user
    initialize_with { new(attributes) }
  end
end
