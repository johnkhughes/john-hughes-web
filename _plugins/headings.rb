# Promote or demote headings to fit document outline
Jekyll::Hooks.register [:pages, :posts], :post_render do |post|
  def normalize(html, limit = 2)
    levels = (1..6)
    diff = limit - levels.find(lambda { limit }) { |n| html.match("<h#{n}") }

    return html if diff == 0 || !levels.include?(limit)

    html.gsub(/(<\/?)h(\d)/) do |match|
      level = $2.to_i + diff
      $1 + (levels.include?(level) ? "h#{level}" : 'p')
    end
  end

  original = post.content
  post.content = normalize(original)
  post.output = post.output.sub(original, post.content)
end
