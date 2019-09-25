require 'redcarpet'


class TaggingExtractor < Redcarpet::Render::HTML
    def initialize
        @headers = []
        super
    end
    
    def header(text, header_level)
        @headers << text.chomp.downcase
        nil
    end

    def get_headers
        @headers
    end
end

# Manages getting tags from markdown content (automagically!)
class TaggingService
    def initialize(article)
        @article = article
        @md = Redcarpet::Markdown.new(TaggingExtractor)
        @md.render(@article.text)
        @tags = @md.renderer.get_headers
    end

    def associate_tags
        # remove all the current tag associations
        @article.tags.destroy_all
        
        # add new association
        @tags.each do |tag|
            new_tag = Tag.find_or_create_by(name: tag)
            @article.tags << new_tag
        end

    end

    def get_tags
        @tags
    end
end