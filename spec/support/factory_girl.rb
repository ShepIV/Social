RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  factory :user do
    # id 999
    # sequence(:id) { |i| "#{i}33"}
    sequence(:email) { |i| "test#{i}@g.ru" }
    # email 'test@g.ru'
    password  '123456'
  end

  # factory :author do
  #   sequence(:email) { |i| "test#{i}@author.ru" }
  #   password  '123456'
  # end

  factory :post do
    text 'text'
  end
end
