require 'rails_helper'

RSpec.describe Chatroom, type: :model do
  describe 'model validations' do
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:topic) }

    it { should validate_uniqueness_of(:slug) }
  end

  describe 'model associations' do
    it { should have_many(:messages) }
    it { should have_many(:users) }
  end
end
