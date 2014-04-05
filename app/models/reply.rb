require 'markdown'

class Reply < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :post
  belongs_to :user

  def rendered_content
    RendersMarkdown.render(content)
  end
end
