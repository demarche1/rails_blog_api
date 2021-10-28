# frozen_string_literal: true

class User < ActiveRecord::Base
  before_validation :set_uid

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable,
         :confirmable,
         :trackable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  include DeviseTokenAuth::Concerns::User

  private

  def set_uid
    self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  end
end
