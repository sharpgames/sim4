# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  desc       :string
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
    validates :desc, presence: true
end
