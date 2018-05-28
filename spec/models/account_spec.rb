require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'validations' do
    it 'has a valid Factory' do
      expect(FactoryBot.build(:account)).to be_valid
    end

    it 'is invalid without a name' do
      expect(FactoryBot.build(:account, name: nil)).not_to be_valid
    end

    it 'is invalid without a path' do
      expect(FactoryBot.build(:account, path: nil)).not_to be_valid
    end

    it 'is invalid without a project_name' do
      expect(FactoryBot.build(:account, project_name: nil)).not_to be_valid
    end

    it 'is invalid without a project_ids' do
      expect(FactoryBot.build(:account, project_ids: nil)).not_to be_valid
    end
  end
end
