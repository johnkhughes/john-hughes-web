# Truncate any generated excerpts that exceed a particular length
Jekyll::Hooks.register([:pages, :posts], :pre_render) do |post|

  # Ignore manual excerpts, which are stored as strings
  next unless post.data['excerpt'].class == Jekyll::Excerpt

  # Append ellipsis if generated excerpt is too long
  words = post.data['excerpt'].to_s.gsub(/<.*?>/m, '').split
  words = words[0, 59].push("\u{2026}") if words.size > 80
  post.data['excerpt'] = words.join(' ')
end
