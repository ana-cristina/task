class CommentsController < ApplicationController
  cache_sweeper :comment_sweeper, :only => [:create, :update, :destroy]
# POST /comment
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back }
      end
    end	
  end
 # PUT /comments/1
  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to  :back }
      end
    end
  end

  # DELETE /comments/1
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end

end
