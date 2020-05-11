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
FactoryBot.define do
  factory :work, class: 'Tag::Work' do
    slug { Faker::Name.name }
    tag
  end
end
