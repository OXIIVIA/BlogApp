class BlogsController < ApplicationController
  def index
    @blogs = Blog.includes(:user).order("id DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    if blog_params[:title].empty? || blog_params[:text].empty?
      @blog = Blog.new
      flash[:alert] = "タイトルと本文はともに入力必須です"
      render :new
    else
      Blog.create(blog_params)
      flash[:notice] = "ブログを投稿しました"
      redirect_to root_path
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
      flash[:notice] = "ブログを更新しました"
      redirect_to blog_path(blog.id)
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy if blog.user_id == current_user.id
    flash[:notice] = "ブログを削除しました"
    redirect_to root_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :text).merge(user_id: current_user.id)
  end
end
