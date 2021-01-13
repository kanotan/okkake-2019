# == Schema Information
#
# Table name: tag_tv_series
#
#  id          :bigint           not null, primary key
#  old_slug    :string
#  slug        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tag_work_id :bigint           not null
#
# Indexes
#
#  index_tag_tv_series_on_old_slug     (old_slug) UNIQUE
#  index_tag_tv_series_on_slug         (slug) UNIQUE
#  index_tag_tv_series_on_tag_work_id  (tag_work_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_work_id => tag_works.id)
#
FactoryBot.define do
  factory :tv_series, class: 'Tag::Work::TvSeries' do
    slug { Faker::Name.name }
    work
  end
end
