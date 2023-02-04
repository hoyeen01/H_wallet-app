# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  first_name      :string           not null
#  last_name       :string           not null
#  email           :string           not null
#  auth_token      :string
#  dob             :string
#  address         :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :first_name, :last_name, :email, :password_digest, presence: true
    validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: 'is not valid'}
    validates :email, uniqueness: true

    has_secure_password

    def generate_token
        token = TokenService.encode({id: id})
        update!(auth_token: token)
    end
end
