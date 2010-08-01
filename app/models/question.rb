class Question < ActiveRecord::Base

  include Markdownable
  include UserOwnable
  include Voteable

  acts_as_taggable

  has_many :answers, :dependent => :destroy

  validates_presence_of :title, :body
  validates_uniqueness_of :title

  def self.per_page
    10
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
