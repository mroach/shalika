class Admin::Cms::PagesController < Admin::AdminController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => [:preview]

  # GET /pages
  # GET /pages.json
  def index
    @pages = ::Cms::Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = ::Cms::Page.new
  end

  # GET /pages/1/edit
  def edit
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

  # POST /pages
  # POST /pages.json
  def create
    @page = ::Cms::Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to polymorphic_path([:admin, @page]), notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to polymorphic_path([:admin, @page]), notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to admin_cms_pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = ::Cms::Page.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:cms_page).permit(:name, :title, :content, :published, :published_at, :slug)
    end
end
