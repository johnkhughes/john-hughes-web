module Jekyll
  module ExtractUrlFilter
    def extract_url(content)
      /<a\s[^>]*?href=(["'])(.+?)\1/i.match(content) { |m| m[2] }
    end
  end
end

Liquid::Template.register_filter(Jekyll::ExtractUrlFilter)
