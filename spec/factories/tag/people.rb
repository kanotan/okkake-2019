# == Schema Information
#
# Table name: tag_people
#
#  id              :bigint           not null, primary key
#  additional_name :string
#  birth_date      :integer
#  birth_month     :integer
#  birth_place     :string
#  birth_year      :integer
#  blood_type      :string
#  bust            :float
#  comments_count  :integer          default(0), not null
#  death_date      :integer
#  death_month     :integer
#  death_place     :string
#  death_year      :integer
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
FactoryBot.define do
  factory :person, class: 'Tag::Person' do
    slug { Faker::Name.name }
    tag
  end
end
