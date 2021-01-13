# == Schema Information
#
# Table name: tag_people
#
#  id              :bigint           not null, primary key
#  additional_name :string
#  birth_date      :date
#  birth_place     :string
#  blood_type      :string
#  bust            :float
#  comments_count  :integer          default(0), not null
#  death_date      :date
#  death_place     :string
#  family_name     :string
#  follows_count   :integer          default(0), not null
#  gender          :string
#  given_name      :string
#  height          :float
#  hip             :float
#  in_language     :string
#  old_slug        :string
#  shoe_size       :float
#  slug            :string           not null
#  trivias_count   :integer          default(0), not null
#  waist           :float
#  weight          :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  tag_id          :bigint           not null
#
# Indexes
#
#  index_tag_people_on_old_slug  (old_slug) UNIQUE
#  index_tag_people_on_slug      (slug) UNIQUE
#  index_tag_people_on_tag_id    (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#
class Tag
  class Person < ApplicationRecord
    self.table_name = 'tag_people'

    belongs_to :tag, required: true

    validates :slug, presence: true, uniqueness: { case_sensitive: false }
    validates :old_slug, uniqueness: { case_sensitive: false }, allow_blank: true
    validates :follows_count, presence: true
    validates :comments_count, presence: true
    validates :trivias_count, presence: true
    validates :birth_year, inclusion: { in: 1900..Time.zone.now.year }, allow_nil: true
    validates :birth_month, inclusion: { in: 1..12 }, allow_nil: true
    validates :birth_date, inclusion: { in: 1..31 }, allow_nil: true
    validates :death_year, inclusion: { in: 1900..Time.zone.now.year }, allow_nil: true
    validates :death_month, inclusion: { in: 1..12 }, allow_nil: true
    validates :death_date, inclusion: { in: 1..31 }, allow_nil: true

    enumerize :gender, in: %i[male female other]
    enumerize :blood_type, in: %i[A B O AB]
  end
end
