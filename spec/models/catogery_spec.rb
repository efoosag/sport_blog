require 'rails_helper'

RSpec.describe Catogery, type: :model do
  context 'before publication' do  # (almost) plain English
    before do
      @category = Catogery.new(name: "")
    end
    it 'should be valid' do   #
      @category.name = "James"
      expect(@category).to be_valid  # test code
    end

    it 'name can not be empty' do   #
      expect(@category).not_to be_valid  # test code
    end

    it 'can not be less than three characters' do   #
      @category.name = "we"
      expect(@category).not_to be_valid  # test code
    end

    it 'can not be greater than twenty five characters' do   #
      @category.name = "we are the world , we are the children"
      expect(@category).not_to be_valid  # test code
    end

    it 'name should be unique' do   #
      @category.name = "sam "
      @category.save
      @category1 = Catogery.new(name: "sam ")
      expect(@category1).not_to be_valid  # test code
    end
  end
end
