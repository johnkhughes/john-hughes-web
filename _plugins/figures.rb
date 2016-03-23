# Convert figures to HTML4 elements for backward compatibility
Jekyll::Hooks.register([:pages, :posts], :post_render) do |post|
  content = post.content
  patterns = [
    %r{<((figure)).*?>(.*?)</\1>}m,
    %r{<(fig(caption)).*?>(.*?)</\1>}m
  ]

  patterns.each do |pattern|
    post.content = post.content.gsub(pattern, '<div class="\2">\3</div>')
  end

  post.output = post.output.sub(content, post.content)
end
