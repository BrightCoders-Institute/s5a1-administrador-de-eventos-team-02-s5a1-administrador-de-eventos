class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "formato de email inválido" }
  has_secure_password

end
