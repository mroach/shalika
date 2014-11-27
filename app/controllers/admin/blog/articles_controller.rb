class Admin::Blog::ArticlesController < Admin::AdminController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => [:preview]

  add_breadcrumb "Blog", :admin_blog_root_path

  # GET /articles
  # GET /articles.json
  def index
    @articles = ::Blog::Article.all
    add_breadcrumb "Articles"
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    add_breadcrumb @article.title
  end

  # GET /articles/new
  def new
    @article = ::Blog::Article.new
    add_breadcrumb "Create new blog post"
  end

  # GET /articles/1/edit
  def edit
    add_breadcrumb "Editing \"#{@article.title}\""
  end

  def preview
    # TODO: This markdown stuff shouldn't be here. This method shouldn't even be here
    text = params[:content]
    renderer = Redcarpet::Render::XHTML.new
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    render html: Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = ::Blog::Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to polymorphic_path([:admin, @article]), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to polymorphic_path([:admin, @article]), notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_blog_articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = ::Blog::Article.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:blog_article).permit(:title, :content, :published, :published_at, :author, :slug)
    end
end
