class SearchController < ApplicationController

	def index
		@tags = Tag.all

	    if params[:tag1 && :tag2 && :tag3]

	      filter1 = Post.tagged_with(params[:tag1])
	      filter2 = Post.tagged_with(params[:tag2])
	      filter3 = Post.tagged_with(params[:tag3])
	      @posts = filter1 & filter2 & filter3

	    elsif params[:tag1 && :tag2]

	      filter1 = Post.tagged_with(params[:tag1])
	      filter2 = Post.tagged_with(params[:tag2])
	      @posts = filter1 & filter2

	    elsif params[:tag1]

	      filter1 = Post.tagged_with(params[:tag1])
	      @posts = filter1
	    
	    else
	      @posts = Post.all
	    end
	end
end