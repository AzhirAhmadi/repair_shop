# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  jti                    :string           not null
#
class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # Callbacks
  before_create {self.jti ||= SecureRandom.uuid}
  
  # Relations
  has_one :shop

  # Others
  def generate_jwt
    JWT.encode({ id: id,
                 exp: 5.days.from_now.to_i },
               Rails.env.devise.jwt.secret_key)
  end
end
