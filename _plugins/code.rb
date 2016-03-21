# If PHP code does not include an opening PHP tag, assume that it should all
# be wrapped in PHP tags.
Jekyll::Hooks.register [:pages, :posts], :pre_render do |post|
  pattern = /(~{4,} +php[\n\r]+)(.*?[\n\r]+~{4,})/m

  post.content = post.content.gsub(pattern) do |match|
    next match if match.include? '<?php'
    Regexp.last_match(1) + 'php fix <?php ' + Regexp.last_match(2)
  end
end

# Remove automatic PHP opening tags
Jekyll::Hooks.register [:pages, :posts], :post_render do |post|
  original = post.content
  pattern = %r{php fix <span class="cp">&lt;\?php</span> }m
  post.content = post.content.gsub(pattern, '')
  post.output = post.output.sub(original, post.content)
end
