require 'markdown'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  has_many :replies

  def rendered_content
    RendersMarkdown.render(content)
  end
end
