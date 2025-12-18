require "commonmarker"

module MarkdownHelper
  def render_markdown(text)
    return "" if text.blank?

    md = text.to_s

    html =
      if defined?(::CommonMarker) && ::CommonMarker.respond_to?(:render_html)
        ::CommonMarker.render_html(md, :DEFAULT, %i[table strikethrough autolink tasklist])
      elsif defined?(::Commonmarker) && ::Commonmarker.respond_to?(:to_html)
        ::Commonmarker.to_html(md, options: { extension: { table: true, strikethrough: true, autolink: true, tasklist: true } })
      else
        md # fallback: mostra texto puro se nada existir
      end

    sanitize(
      html,
      tags: %w[p br strong em del a ul ol li blockquote code pre h1 h2 h3 h4 h5 h6 hr table thead tbody tr th td],
      attributes: %w[href title]
    )
  end
end
