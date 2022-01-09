# == Schema Information
#
# Table name: tags
#
#  id             :bigint           not null, primary key
#  alternate_name :string           not null
#  description    :text
#  image_data     :text
#  name           :string           not null
#  url            :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Tag < ApplicationRecord
  include ImageUploader[:image]
end
