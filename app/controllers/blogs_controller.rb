class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]

  layout "blog"

  # GET /blogs
  def index
    @blogs = Blog.all
    @page_title = "Blog | chasejensen.com"
  end

  # GET /blogs/1
  def show
    @page_title = @blog.title
    # TODO: Create @blog.keywords dedicated to SEO optimized keywords, rather than body
    @seo_keywords = @blog.body
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Post was successfully destroyed.' }
    end
  end

  def toggle_status
    @blog.toggle_status
    redirect_to blogs_url, notice: 'Post status has been updated.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:body, :title)
    end
end
