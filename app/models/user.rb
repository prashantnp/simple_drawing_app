class User < ActiveRecord::Base
	USER_NAME_REGEX = %r{\A[a-zA-Z][a-zA-Z0-9._]+\z}

	validates :user_name,
            uniqueness: true,
            presence: true,
            format: { with: USER_NAME_REGEX }


  has_many :grid_cells, foreign_key: :last_colored_by_id, class_name: 'GridCell'

	def self.create_random_user
		User.create(user_name: generate_user_name)
	end

	def self.generate_user_name
		loop do
			user_name = Faker::Name.name.downcase.gsub(/\s/, '_').gsub(/\W/, '')
      break user_name if !User.exists?(user_name: user_name) && user_name.match(USER_NAME_REGEX)
    end
	end
end
