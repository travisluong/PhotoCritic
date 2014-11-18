class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :thumb

  def thumb
    object.image.url(:thumb)
  end
end
