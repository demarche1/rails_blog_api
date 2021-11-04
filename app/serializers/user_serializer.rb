class UserSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :nickname, :email
end
