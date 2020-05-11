# == Schema Information
#
# Table name: tag_works
#
#  id             :bigint           not null, primary key
#  comments_count :integer          default(0), not null
#  follows_count  :integer          default(0), not null
#  in_language    :string
#  old_slug       :string
#  slug           :string           not null
#  trivias_count  :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  tag_id         :bigint           not null
#
# Indexes
#
#  index_tag_works_on_old_slug  (old_slug) UNIQUE
#  index_tag_works_on_slug      (slug) UNIQUE
#  index_tag_works_on_tag_id    (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#

class Tag
  class Work < ApplicationRecord
    self.table_name = 'tag_works'

    belongs_to :tag, required: true

    validates :slug, presence: true, uniqueness: { case_sensitive: false }
    validates :old_slug, uniqueness: { case_sensitive: false }, allow_blank: true
    validates :follows_count, presence: true
    validates :comments_count, presence: true
    validates :trivias_count, presence: true
  end
end
