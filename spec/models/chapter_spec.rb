require 'rails_helper'

RSpec.describe Chapter, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:chapter)).to be_valid
  end
  
  context 'relations' do
    it { should have_many(:screencasts).dependent(:destroy) }
    it { should belong_to(:user) }
  end
  
  context 'validations' do
    # Fields
    it { should validate_presence_of(:title) }
    it 'should validate presense of slug' do
      chapter = FactoryGirl.create(:chapter)
      chapter.slug = nil
      chapter.save
      expect(chapter.slug).not_to eq(nil)
    end
    it { should validate_uniqueness_of(:title) }
    it { should validate_uniqueness_of(:slug) }
    
    # Relations
    context 'relations' do
      it { should validate_presence_of(:user) }
    end
  end
end