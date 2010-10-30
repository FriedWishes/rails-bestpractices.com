class Question < ActiveRecord::Base

  include Markdownable
  include UserOwnable
  include Voteable
  include Commentable

  acts_as_taggable

  has_many :answers, :include => :user, :dependent => :destroy

  validates_presence_of :title, :body
  validates_uniqueness_of :title

  scope :not_answered, where(:answers_count => 0)

  define_index do
    indexes :title, :body

    has :vote_points, :answers_count, :view_count, :id

    set_property :field_weights => {
      :title => 10,
      :body => 1
    }
  end

  def self.per_page
    10
  end

  def tweet_title
    "Question: #{title}"
  end

  def tweet_path
    "questions/#{to_param}"
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
