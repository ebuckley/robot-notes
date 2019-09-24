module ApplicationHelper
    def my_link_to(text, href)

        if href == request.url
            current_class = 'active'
        else
            current_class = ''
        end
        "<a href='#{href}' class=#{current_class}>#{text}</a>".html_safe
    end
end 
