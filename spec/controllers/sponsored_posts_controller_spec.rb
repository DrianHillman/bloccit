require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }

  let(:my_post) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 25) }


  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_post.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_post.id
      expect(response).to render_template :show
    end

    it "assigns my_post to @spons_post" do
      get :show, topic_id: my_topic.id, id: my_post.id
      expect(assigns(:spons_post)).to eq(my_post)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end

    it "instantiates @spons_post" do
      get :new, topic_id: my_topic.id
      expect(assigns(:spons_post)).not_to be_nil
    end
  end
  
  describe "POST create" do
     it "increases the number of SponsoredPost by 1" do
       expect{post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(1000)}}.to change(SponsoredPost,:count).by(1)
     end

     it "assigns the new post to @spons_post" do
       post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(1000)}
       expect(assigns(:spons_post)).to eq SponsoredPost.last
     end

     it "redirects to the new post" do
       post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(1000)}
       expect(response).to redirect_to [my_topic, SponsoredPost.last]
     end
   end
  
  describe "GET edit" do
     it "returns http success" do
       get :edit, topic_id: my_topic.id, id: my_post.id
       expect(response).to have_http_status(:success)
     end

     it "renders the #edit view" do
       get :edit, topic_id: my_topic.id, id: my_post.id
       expect(response).to render_template :edit
     end

     it "assigns post to be updated to @spons_post" do
       get :edit, topic_id: my_topic.id, id: my_post.id
       post_instance = assigns(:spons_post)

       expect(post_instance.id).to eq my_post.id
       expect(post_instance.title).to eq my_post.title
       expect(post_instance.body).to eq my_post.body
       expect(post_instance.price).to eq my_post.price
     end
   end
   
   describe "PUT update" do
     it "updates post with expected attributes" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
       new_price = rand(1000)

       put :update, topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body, price: new_price}

       updated_post = assigns(:spons_post)
       expect(updated_post.id).to eq my_post.id
       expect(updated_post.title).to eq new_title
       expect(updated_post.body).to eq new_body
       expect(updated_post.price).to eq new_price
     end

     it "redirects to the updated post" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
       new_price = rand(1000)

       put :update, topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body, price: new_price}
 
       expect(response).to redirect_to [my_topic, my_post]
     end
   end
   
      describe "DELETE destroy" do
     it "deletes the post" do
       delete :destroy, topic_id: my_topic.id, id: my_post.id
       count = Post.where({id: my_post.id}).size
       expect(count).to eq 0
     end

     it "redirects to topic show" do
       delete :destroy, topic_id: my_topic.id, id: my_post.id
       expect(response).to redirect_to my_topic
     end
   end

end
