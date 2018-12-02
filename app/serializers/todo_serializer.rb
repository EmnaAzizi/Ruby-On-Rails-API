class TodoSerializer < ActiveModel::Serializer
  attributes :id , :title , :done , :todotime
end
