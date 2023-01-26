class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  enum document_type: [:cc, :ti, :ce, :ps, :rc]
  enum career: [:sistemas, :industrial, :contaduria, :administracion]

  validates :document_number, :email, uniqueness: true
  validates :name, :last_name, :email, :document_number, :document_type, :career, presence: true

  has_many :favorite_books
end
