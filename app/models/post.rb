# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text             not null
#  sub_id     :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  belongs_to :sub
  has_many :post_subs, dependent: :destroy

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  has_many :subs,
    through: :post_subs,
    source: :sub

  after_create :make_postsub

  def make_postsub
    PostSub.create!(post_id: self.id, sub_id: self.sub_id)
  end
end
