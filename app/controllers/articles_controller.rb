
class ArticlesController < ApplicationController
    include Secured
    def new
        @article = Article.new
    end

    def create
        user_id = session[:userinfo]["uid"]
        @article = Article.new(article_params)
        @article.owner_id = user_id
        tagging_service = TaggingService.new(@article)
        tagging_service.associate_tags
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def show
        @article = Article.find(params[:id])
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
        @html_content = markdown.render(@article.text)
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            tagging_service = TaggingService.new(@article)
            tagging_service.associate_tags
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    def index
        @articles = Article.all.order(updated_at: :desc)
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
