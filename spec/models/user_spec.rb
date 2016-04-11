require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  
  context 'relations' do
    it { should have_many(:articles).dependent(:destroy) }
  end
end