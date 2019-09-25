require 'redcarpet'


class TagCountRenderer < Redcarpet::Render::HTML
    def header(text, header_level)
        puts "#{header_level} - Parsing #{text}"
        nil
    end
end

class ArticleTagger
    attr_reader :article
    def initialize(article: nil)
        self.article = article
        markdown = Redcarpet::Markdown.new(TagCountRenderer)
    end

    # Updates the articles tags based of it's content
    def update_tags
        markdown.render(article.text)
        markdown.renderer.get_headers
    end
end