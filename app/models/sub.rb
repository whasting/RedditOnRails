# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ActiveRecord::Base

  has_many :post_subs, dependent: :destroy

  belongs_to :moderator,
    foreign_key: :user_id,
    class_name: :User

  has_many :posts,
    through: :post_subs,
    source: :post
end
