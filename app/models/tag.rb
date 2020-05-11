# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  name_en    :string
#  name_kana  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_name  (name) UNIQUE
#
class Tag < ApplicationRecord
  has_many :works, dependent: :destroy, class_name: Tag::Work.name

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
