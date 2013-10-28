class PostsController < ApplicationController
	  
	http_basic_authenticate_with name: "Alex", password: "123", except: [:index, :show]

	def new
		@post = Post.new
	end

	def index
		@posts = Post.all
	end

	def create
	  @post = Post.new(params[:post]).permit(:title, :text)

	  if @post.save
	  	redirect_to posts_path, :notice => "Post created."
	  else
	  	render 'new'
	  end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
	 
	  if @post.update(params[:post])
	    redirect_to @post
	  else
	    render 'edit'
	  end
	end

	def show
		@post = Post.find(params[:id])
	end
	 
	def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
 
  redirect_to posts_path
end


	private
	  def post_params
	    params.require(:post).permit(:title, :text)
	  end
end
