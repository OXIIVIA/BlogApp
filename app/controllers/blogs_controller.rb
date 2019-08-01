class BlogsController < ApplicationController
  def index
    @blogs = Blog.includes(:user).order("id DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    if Blog.create(blog_params)
      redirect_to root_path
      # アラートを表示
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params) 
      redirect_to blog_path(blog.id)
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy if blog.user_id == current_user.id
    redirect_to root_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :text).merge(user_id: current_user.id)
  end
end
