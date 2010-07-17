class Implementation < ActiveRecord::Base
  include Markdownable

  belongs_to :user
  belongs_to :post
  has_many :comments, :as => :commentable, :dependent => :destroy

  def self.per_page
    10
  end
  
  def belongs_to?(user)
    user && user_id == user.id
  end
end