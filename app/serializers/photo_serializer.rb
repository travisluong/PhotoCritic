class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :title, :critique, :pic, :thumb, :medium

  def thumb
    object.pic_url(:thumbnail)
  end

  def medium
    object.pic_url(:standard)
  end
end
