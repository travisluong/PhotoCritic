class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :title, :critique, :image, :thumb, :medium

  def thumb
    object.image.url(:thumb)
  end

  def medium
    object.image.url(:medium)
  end
end
