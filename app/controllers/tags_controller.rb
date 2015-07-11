class TagsController < ApplicationController
	before_action :set_tag, only: [:destroy]
	
	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find_by_name!(params[:id])
		@posts = Post.tagged_with(@tag.name) 
	end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

end