require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

        let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
         # #13
       let(:my_sponsored) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: "00") }

        describe "GET new" do
            it "returns http success" do
                get :new, params: { topic_id: my_topic.id }
                expect(response).to have_http_status(:success)
            end

            # #2
            it "renders the #new view" do
                get :new, params: { topic_id: my_topic.id }
                expect(response).to render_template :new
            end

            # #3
            it "instantiates @sponsored" do
                get :new, params: { topic_id: my_topic.id }
                expect(assigns(:sponsored_post)).not_to be_nil
            end
        end

        describe "POST create" do
            # #4
            it "increases the number of Sponsored Post by 1" do
                expect{ post :create, params: { topic_id: my_topic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: "00" } } }.to change(SponsoredPost, :count).by(1)
            end

            # #5
            it "assigns the new sponsored sponsored to @sponsored" do
                post :create, params: { topic_id: my_topic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: "00" } }
                expect(assigns(:sponsored_post)).to eq SponsoredPost.last
            end

            # #6
            it "redirects to the new sponsored post" do
                post :create, params: { topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: "00" } }
                expect(response).to redirect_to [my_topic, SponsoredPost.last]
            end
        end

        describe "GET show" do
            it "returns http success" do
                # #16
                get :show, params: { topic_id: my_topic.id, id: my_sponsored.id }
                expect(response).to have_http_status(:success)
            end
            it "renders the #show view" do
                # #17
                get :show, params: { topic_id: my_topic.id, id: my_sponsored.id }
                expect(response).to render_template :show
            end

            it "assigns my_sponsored to @sponsored" do
                get :show, params: { topic_id: my_topic.id, id: my_sponsored.id }
                # #18
                expect(assigns(:sponsored_post)).to eq(my_sponsored)
            end
        end

        describe "GET edit" do
            it "returns http success" do
                get :edit, params: { topic_id: my_topic.id, id: my_sponsored.id }
                expect(response).to have_http_status(:success)
            end

            it "renders the #edit view" do
                get :edit, topic_id: my_topic.id, id: my_sponsored.id
                expect(response).to render_template :edit
            end

            # #2
            it "assigns sponsored post to be updated to @sponsored" do
                get :edit, params: { topic_id: my_topic.id, id: my_sponsored.id }

                post_instance = assigns(:sponsored_post)

                expect(post_instance.id).to eq my_sponsored.id
                expect(post_instance.title).to eq my_sponsored.title
                expect(post_instance.body).to eq my_sponsored.body
            end
        end

        describe "PUT update" do
            it "updates sponsored post with expected attributes" do
                new_title = RandomData.random_sentence
                new_body = RandomData.random_paragraph
                new_price = 100

                 put :update, params: { topic_id: my_topic.id, id: my_sponsored.id, sponsored_post: {title: new_title, body: new_body, price: new_price } }

                # #3
                updated_post = assigns(:sponsored_post)
                expect(updated_post.id).to eq my_sponsored.id
                expect(updated_post.title).to eq new_title
                expect(updated_post.body).to eq new_body
                expect(updated_post.price).to eq new_price

            end

            it "redirects to the updated post" do
                new_title = RandomData.random_sentence
                new_body = RandomData.random_paragraph
                new_price = 100

                put :update, params: { topic_id: my_topic.id, id: my_sponsored.id, sponsored_post: {title: new_title, body: new_body } }
               expect(response).to redirect_to [my_topic, my_sponsored]
            end
        end

        describe "DELETE destroy" do
            it "deletes the post" do
                delete :destroy, params: { topic_id: my_topic.id, id: my_sponsored.id }
                count = SponsoredPost.where({id: my_sponsored.id}).size
                expect(count).to eq 0
            end

            it "redirects to topic show" do
                delete :destroy, params: { topic_id: my_topic.id, id: my_sponsored.id }
                expect(response).to redirect_to my_topic
            end
        end
    end
