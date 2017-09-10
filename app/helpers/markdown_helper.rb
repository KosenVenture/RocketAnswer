module MarkdownHelper
  def markdown(text)
    unless false#@markdown
      renderer = Redcarpet::Render::HTML.new(
        filter_html: true,
        hard_wrap: true,
        link_attributes: { target: '_blank' }
      )
      @markdown = Redcarpet::Markdown.new(renderer,
        no_intra_emphasis: true,
      )
    end

    sanitize @markdown.render(text)
  end
end
