# A proof of concept for extracting headers using a cusotm renderer

require 'redcarpet'


class MyRenderer < Redcarpet::Render::HTML
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
markdown = Redcarpet::Markdown.new(MyRenderer)

md_content = File.open("/home/ersin/Code/ersin/notes/2019-1-28").read

html_content = markdown.render(md_content)