require 'rails_helper'

RSpec.describe User, type: :model do

  it 'orders by last name' do
    lindeman = User.create!(email: 'iooi@y.ru', password: 'Lindeman')
    chelimsky = User.create!(email: 'aaa@y.ru', password: 'Chelimsky')

    expect(User.order(:email)).to eq([chelimsky, lindeman])
  end

  # pending "add some examples to (or delete) #{__FILE__}"
end
