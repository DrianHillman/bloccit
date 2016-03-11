class SponsoredPostsController < ApplicationController
  def show
    @spons_post = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @spons_post = SponsoredPost.new
  end
  
  def create
     @spons_post = SponsoredPost.new
     @spons_post.title = params[:post][:title]
     @spons_post.body = params[:post][:body]
     @spons_post.price = params[:post][:price]
     @topic = Topic.find(params[:topic_id])

     @spons_post.topic = @topic

     if @spons_post.save
       flash[:notice] = "Post was saved."

       redirect_to [@topic, @spons_post]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :new
     end
  end

  def edit
     @spons_post = SponsoredPost.find(params[:id])
  end
  
  def update
     @spons_post = SponsoredPost.find(params[:id])
     @spons_post.title = params[:post][:title]
     @spons_post.body = params[:post][:body]
     @spons_post.price = params[:post][:price]

     if @spons_post.save
       flash[:notice] = "Sponsored Post was updated."
       
       redirect_to [@spons_post.topic, @spons_post]
     else
       flash.now[:alert] = "There was an error saving the sponsored post. Please try again."
       render :edit
     end
   end
   
   def destroy
     @spons_post = SponsoredPost.find(params[:id])

     if @spons_post.destroy
       flash[:notice] = "\"#{@spons_post.title}\" was deleted successfully."

        redirect_to @spons_post.topic
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end
end
