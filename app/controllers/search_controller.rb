class SearchController < ApplicationController

	def index
		@tags = Tag.all

	    if params[:tag1 && :tag2 && :tag3]

	      filter1 = Post.tagged_with(params[:tag1])
	      filter2 = Post.tagged_with(params[:tag2])
	      filter3 = Post.tagged_with(params[:tag3])
	      combo1 = filter1 & filter2 & filter3

	      @posts = combo1.sample(1)

	      redirect_to post_path(@posts[0].author)

	    elsif params[:tag1 && :tag2]

	      filter1 = Post.tagged_with(params[:tag1])
	      filter2 = Post.tagged_with(params[:tag2])
	      combo2 = filter1 & filter2
	      
	      @posts = combo2.sample(1)

	      redirect_to post_path(@posts[0].author)

	    elsif params[:tag1]

	      filter1 = Post.tagged_with(params[:tag1]).order("RANDOM()").limit(1)
	      @posts = filter1

	      redirect_to post_path(@posts[0].author)
	    
	    else
	      @posts = Post.all
	    end
	end
end