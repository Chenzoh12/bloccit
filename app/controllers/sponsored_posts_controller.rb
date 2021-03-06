class SponsoredPostsController < ApplicationController

      def show
         @sponsored_post = SponsoredPost.find(params[:id])
      end

      def new
        @topic = Topic.find(params[:topic_id])
        @sponsored_post = SponsoredPost.new
      end

      def create
        # #9
        @sponsored_post = SponsoredPost.new
        @sponsored_post.title = params[:sponsored_post][:title]
        @sponsored_post.body = params[:sponsored_post][:body]
        @sponsored_post.price = params[:sponsored_post][:price]
        @topic = Topic.find(params[:topic_id])

        @sponsored_post.topic = @topic
        # #10
        if @sponsored_post.save
          # #11
          flash[:notice] = "SponsoredPost was saved."
          redirect_to [@sponsored_post.topic, @sponsored_post]
        else
          # #12
          flash.now[:alert] = "There was an error saving the sponsored. Please try again."
          render :new
        end
      end

      def edit
        @sponsored_post = SponsoredPost.find(params[:id])
      end

        def update
            @sponsored_post = SponsoredPost.find(params[:id])
            @sponsored_post.title = params[:sponsored_post][:title]
            @sponsored_post.body = params[:sponsored_post][:body]
            @sponsored_post.price = params[:sponsored_post][:price]
            @topic = Topic.find(params[:topic_id])
         # #35
            @sponsored_post.topic = @topic

            if @sponsored_post.save
                flash[:notice] = "SponsoredPost was updated."
                redirect_to [@sponsored_post.topic, @sponsored_post]
            else
                flash.now[:alert] = "There was an error saving the sponsored. Please try again."
                render :edit
            end
        end

        def destroy
            @sponsored_post = SponsoredPost.find(params[:id])

            # #8
            if @sponsored_post.destroy
                flash[:notice] = "\"#{@sponsored_post.title}\" was deleted successfully."
                redirect_to @sponsored_post.topic
            else
                flash.now[:alert] = "There was an error deleting the sponsored."
                render :show
            end
        end
    end
