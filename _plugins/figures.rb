# Convert figures to HTML4 elements for backward compatibility
Jekyll::Hooks.register :posts, :post_render do |post|
  original = post.content
  patterns = [
    /<((figure)).*?>(.*?)<\/\1>/m,
    /<(fig(caption)).*?>(.*?)<\/\1>/m
  ]

  patterns.each do |pattern|
    post.content = post.content.gsub(pattern, '<div class="\2">\3</div>')
  end

  post.output = post.output.sub(original, post.content)
end
