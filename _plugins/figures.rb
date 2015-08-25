module Jekyll
  class NormalizeFigures < Converter

    safe true
    priority :low

    def normalize(html)
      html.gsub(/<(figure).*?>(.*?)<\/\1>/m, '<div class="\1">\2</div>')
        .gsub(/<(fig(caption)).*?>(.*?)<\/\1>/m, '<div class="\2">\3</div>')
    end

    def matches(ext)
      true
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      normalize(content)
    end

  end
end
