module MarkdownHelper
  def markdown(text)
    unless false#@markdown
      renderer = Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
      @markdown = Redcarpet::Markdown.new(renderer,
        autolink: true,
        no_intra_emphasis: true)
    end

    @markdown.render(text).html_safe
  end
end