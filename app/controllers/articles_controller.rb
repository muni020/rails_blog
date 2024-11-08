class ArticlesController < ApplicationController
  
  def index
   show_request_details
  @articles = Article.all
    p "==================================="
    @articles.each do |article| 
       p article
    end
    p "==================================="
  end

  def show
   show_request_details
    p "pppppppp-------- #{params[:id]}"
     @article = Article.find(params[:id])
     p "One Article : #{@article}"
  end

  def new
   show_request_details
     @article = Article.new
  end

  def create
   show_request_details
     @article = Article.new(article_params)
     p "==================="
     p "Before Article Save"
     p article_params
     p "==================="
     if @article.save
        redirect_to @article 
     else
        render :new, status: :unprocessable_entity
     end
  end


  def edit
   show_request_details
       @article = Article.find(params[:id])
  end
  
  def update
   show_request_details
     @article = Article.find(params[:id])
     p "=========Updatee============"
     p @article
     p "=========Updatee============"
     if @article.update(article_params)
      redirect_to @article
     else
      render :edit, status: :unprocessable_entity
     end
  end

  def destroy
    p "Here is delete Method==========================="
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end


  private
    def article_params
      p "Params Require Method --------------    #{params}"
      params.require(:article).permit(:title, :body, :status)
    end


  def show_request_details
    p "==================Request Start=================="
    p "Request Method: #{request.request_method}"
    p "Request Path: #{request.path}"
    p "Request Full URL: #{request.url}"
    p "Request Parameters: #{request.params.inspect}"
    p "Request Headers: #{request.headers.env.select { |k, _| k.start_with?('HTTP_') }.inspect}"
    p "==================Request End=================="
  end
end
