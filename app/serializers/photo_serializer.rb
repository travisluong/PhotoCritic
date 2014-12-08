class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :title, :critique, :thumbnail, :medium

  def thumbnail
    object.pic_url(:thumbnail)
  end

  def medium
    object.pic_url(:standard)
  end
end
