require 'rails_helper'

describe Word, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:spelling)}
    it {should validate_presence_of(:length)}
  end
end
