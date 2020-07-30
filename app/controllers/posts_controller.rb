class PostsController < ApplicationController
  http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", only:
:dashboard

protect_from_forgery with: :null_session

  def index
    @posts = Post.order(created_at: :desc).all
  end

  def create
    @post = Post.create(title: params[:title],
                content: params[:content],
                image_url: params[:image_url])
  
                if @post.valid?
                   @post.save
                  redirect_to root_path, notice: 'Post creado'
                else
                  redirect_to root_path, alert: 'No se creo el post'
                end
                
              
  end

  def dashboard
    @posts = Post.all
  end
end
