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
require 'rails_helper'

RSpec.describe Tag::Person, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:tag) }
  end

  describe 'Attributes' do
    describe '#slug' do
      it { is_expected.to validate_presence_of(:slug) }

      it do
        create(:person, slug: 'A')
        expect(subject).to validate_uniqueness_of(:slug).case_insensitive
      end
    end

    describe '#old_slug' do
      it do
        create(:person, old_slug: 'A')
        expect(subject).to validate_uniqueness_of(:old_slug).case_insensitive
      end
    end

    describe '#follows_count' do
      it { is_expected.to validate_presence_of(:follows_count) }
    end

    describe '#comments_count' do
      it { is_expected.to validate_presence_of(:comments_count) }
    end

    describe '#trivias_count' do
      it { is_expected.to validate_presence_of(:trivias_count) }
    end

    describe '#birth_year' do
      it { is_expected.to validate_inclusion_of(:birth_year).in_range(1900..Time.zone.now.year) }
    end

    describe '#birth_month' do
      it { is_expected.to validate_inclusion_of(:birth_month).in_range(1..12) }
    end

    describe '#birth_date' do
      it { is_expected.to validate_inclusion_of(:birth_date).in_range(1..31) }
    end

    describe '#death_year' do
      it { is_expected.to validate_inclusion_of(:death_year).in_range(1900..Time.zone.now.year) }
    end

    describe '#death_month' do
      it { is_expected.to validate_inclusion_of(:death_month).in_range(1..12) }
    end

    describe '#death_date' do
      it { is_expected.to validate_inclusion_of(:death_date).in_range(1..31) }
    end
  end
end
