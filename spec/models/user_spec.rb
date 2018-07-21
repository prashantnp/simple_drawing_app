require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Creation" do
    after(:each) do
      User.destroy_all
    end

    it 'is invalid without a user name or a user name with non word characters' do
      invalid_user_names = [nil, '', ' ', '123', 'user!@#', 'user name']

      invalid_user_names.each do |invalid_user_name|
        user = User.new(user_name: invalid_user_name)
        expect(user).to be_invalid
      end
    end

    it 'is invalid when the user name is not unique' do
    	user_name = User.generate_user_name
    	User.create(user_name: user_name)
    	duplicate_user = User.new(user_name: user_name)
    	expect(duplicate_user).to be_invalid
    end

    it 'is valid with a user name' do
      user = User.new(user_name: User.generate_user_name)
      expect(user).to be_valid
    end

  	it 'can be created with randomly generated user name' do
  		expect { User.create_random_user }.to change { User.count }.by(1)
  	end
  end
end