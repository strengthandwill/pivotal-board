require 'rails_helper'

RSpec.describe Setting, type: :model do
  describe 'validations' do
    it 'has a valid Factory' do
      expect(FactoryBot.build(:setting)).to be_valid
    end

    it 'is invalid without a unstarted_color' do
      expect(FactoryBot.build(:setting, unstarted_color: nil)).not_to be_valid
    end

    it 'is invalid without a started_color' do
      expect(FactoryBot.build(:setting, started_color: nil)).not_to be_valid
    end

    it 'is invalid without a finished_color' do
      expect(FactoryBot.build(:setting, finished_color: nil)).not_to be_valid
    end

    it 'is invalid without a delivered_color' do
      expect(FactoryBot.build(:setting, delivered_color: nil)).not_to be_valid
    end

    it 'is invalid without a impeded_color' do
      expect(FactoryBot.build(:setting, impeded_color: nil)).not_to be_valid
    end

    it 'is invalid without a accepted_color' do
      expect(FactoryBot.build(:setting, accepted_color: nil)).not_to be_valid
    end

    it 'is invalid without a feature_color' do
      expect(FactoryBot.build(:setting, feature_color: nil)).not_to be_valid
    end

    it 'is invalid without a chore_color' do
      expect(FactoryBot.build(:setting, chore_color: nil)).not_to be_valid
    end

    it 'is invalid without a bug_color' do
      expect(FactoryBot.build(:setting, bug_color: nil)).not_to be_valid
    end

    it 'is invalid without a retro_color' do
      expect(FactoryBot.build(:setting, retro_color: nil)).not_to be_valid
    end

    it 'is invalid without a interval' do
      expect(FactoryBot.build(:setting, interval: nil)).not_to be_valid
    end
  end
end