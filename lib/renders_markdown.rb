require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

class HighlightedHTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end

module RendersMarkdown
  ENABLED_EXTENSIONS = {
    no_intra_emphasis: true,
    fenced_code_blocks: true,
    autolink: true
  }

  def self.renderer
    @renderer ||= Redcarpet::Markdown.new(HighlightedHTML, ENABLED_EXTENSIONS)
  end

  def self.render(text)
    renderer.render(text)
  end
end
