require 'redcarpet'

module RendersMarkdown
  ENABLED_EXTENSIONS = {
    no_intra_emphasis: true,
    fenced_code_blocks: true,
    autolink: true
  }

  def self.renderer
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, ENABLED_EXTENSIONS)
  end

  def self.render(text)
    renderer.render(text)
  end
end
