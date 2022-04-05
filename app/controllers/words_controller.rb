class WordsController < ApplicationController
    # before_action call the method which is described. just before perform the actual actions.
    before_action :authenticate_user!, only: [ :new, :create ]
    before_action :set_method, only: %i[show edit update destroy]    
    
    def index
        @words = Word.all
    end

    def new
        @word = Word.new
    end

    def create
        @word = Word.new(word_params)
        if @word.save
            redirect_to(words_path)
        else
            render :new
        end
    end
    def word_params
        params.require(:word).permit(:content, :language_id)
    end
    
    def show; end       # you can delete or write with semicolumn if action is empty

    def edit
        # @word = Word.find(params[:id])
    end

    def update
        # @word = Word.find(params[:id])
        if @word.update(word_params)
            redirect_to(word_path(@word))
        else
            render :edit
        end
    end

    def destroy
        # @word = Word.find(params[:id])
        @word.destroy
        redirect_to(words_path)
    end

    def set_method
        @word = Word.find(params[:id])
    end
end