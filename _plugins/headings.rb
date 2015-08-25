module Jekyll
  class NormalizeHeadings < Converter

    safe true
    priority :low

    def normalize(html, limit = 1)

      levels = (1..6)
      diff = limit - levels.find(lambda { limit }) { |n| html.match("<h#{n}") }

      return html if diff == 0 || !levels.include?(limit)

      html.gsub(/(<\/?)h(\d)/) do |match|
        level = $2.to_i + diff
        $1 + (levels.include?(level) ? "h#{level}" : 'p')
      end

    end

    def matches(ext)
      true
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      limit = @config['normalize'] || 2
      normalize(content, limit)
    end

  end
end
