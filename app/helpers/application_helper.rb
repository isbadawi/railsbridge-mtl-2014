module ApplicationHelper
  def render_markdown(text)
    RendersMarkdown.render(text).html_safe
  end
end
