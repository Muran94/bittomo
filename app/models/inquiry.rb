# == Schema Information
#
# Table name: inquiries
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  reply_email :string
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Inquiry < ApplicationRecord
  belongs_to :user

  validates :reply_email, presence: true
  validates :body, presence: true
end
