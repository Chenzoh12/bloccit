class QuestionsController < ApplicationController
    def index
        @question = Question.all
    end

    def show
        @question = Question.find(params[:id])
    end

    def new
        @question = Question.new
    end

    def edit
        @question = Question.find(params[:id])
    end

    def create
        # #9
        @question = Question.new
        @question.title = params[:question][:title]
        @question.body = params[:question][:body]
        @question.resolved = params[:question][:resolved]

        # #10
        if @question.save
            # #11
            flash[:notice] = "question was saved."
            redirect_to @question
        else
            # #12
            flash.now[:alert] = "There was an error saving the question. Please try again."
            render :new
        end
    end

    def update
        @question = Question.find(params[:id])
        @question.title = params[:question][:title]
        @question.body = params[:question][:body]
        @question.resolved = params[:question][:resolved]

        if @question.save
            # #11
            flash[:notice] = "question was saved."
            redirect_to @question
        else
            # #12
            flash.now[:alert] = "There was an error saving the question. Please try again."
            render :new
        end
    end

    def destroy
        @question = Question.find(params[:id])

        # #8
        if @question.destroy
            flash[:notice] = "\"#{@question.title}\" was deleted successfully."
            redirect_to questions_path
        else
            flash.now[:alert] = "There was an error deleting the question."
            render :show
        end
    end
end
