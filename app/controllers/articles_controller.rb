class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.order(:id)
    end

    def show
    end

    def new
        @article = Article.new
    end

    # def create
    # @article = Article.new
    # @article.title = params[:title]
    # @article.body = params[:body]

    #     if @article.save
    #     redirect_to '/articles'
    #     else
    #         render :new
    #     end
    # end
    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to articles_path
        else
            render :edit, status: :unprocessable_entity
        end

    end

    def edit  
    end

    def update 
        if @article.update(article_params)
            redirect_to articles_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private
    def article_params
        params.require(:article).permit(:title, :body, :status)
    end

    def set_article
        @article = Article.find(params[:id])
    end

  
end
