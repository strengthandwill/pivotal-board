require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'validations' do
    it 'has a valid Factory' do
      expect(FactoryBot.build(:person)).to be_valid
    end

    it 'is invalid without a person_id' do
      expect(FactoryBot.build(:person, person_id: nil)).not_to be_valid
    end

    it 'is invalid without a name' do
      expect(FactoryBot.build(:person, name: nil)).not_to be_valid
    end

    it 'is invalid without an email' do
      expect(FactoryBot.build(:person, email: nil)).not_to be_valid
    end
  end
end