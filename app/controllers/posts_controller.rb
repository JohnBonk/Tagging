class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  


  def index
    @tags = Tag.all
    @posts = Post.all
  end


  def show
    if params[:id].nil?
      redirect_to root_path
    else
      @post = Post.find_by_author!(params[:id])
    end
  end

  # GET /posts/new
  def new
    @tags = Tag.all
    @posts = Post.all
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit

  end


  def create
    @post = Post.new(post_params)

      if @post.save
        redirect_to post_path(@post.author)
      else
        format.html { render root_path }
      end

  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_url, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:id, :author, :content, :all_tags, :thumbnail, :step, :step2, :step3)
    end
end
