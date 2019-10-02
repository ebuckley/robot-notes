module ApplicationHelper
    def my_link_to(text, href)

        if href == request.url
            current_class = 'nav-link active'
        else
            current_class = 'nav-link'
        end
        "<a href='#{href}' class=#{current_class}>#{text}</a>".html_safe
    end
end 
