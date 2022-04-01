require 'rails_helper'

RSpec.describe WordsController, type: :controller do
    describe "GET index" do
        before { get :index }
        context "some words are present" do
            let!(:word) {create(:word)}
            it "assigns @words" do
                expect(assigns(:words)).to eq([word])
            end

            it "renders the index template" do
                expect(response).to render_template("index")
            end
        end

        context "some words are not present" do
            it "assigns @words" do
                expect(assigns(:words)).to eq([])
            end
            it "renders the index template" do
                expect(response).to render_template("index")
            end
        end

      
    end
    describe "GET new" do
        before { get :new }
        it "assigns @word" do
            expect(assigns(:word)).to be_a_new(Word)
        end
        it "render the new templete" do
            expect(response).to render_template("new")
        end
    end

    describe "POST create" do
        subject { post :create, params: params }
        
        context "valid params" do
            let(:params) do
                { word: { content: 'cat', language: 'English'} } 
            end

            it "create new word" do
                expect { subject }.to change(Word, :count).from(0).to(1)
            end
        end
        context "invalid params" do
            let(:params) do
                { word: { content: 'cat'} } 
            end

            it "Does not create new word" do
                expect { subject }.not_to change(Word, :count)
            end
        end
    end

    describe "GET show" do
        before { get :show, params: params }
        
        let(:params) do
            { id: word.id }
        end

        let!(:word) { create(:word) } 

        it "assign @word" do
            expect(assigns(:word)).to eq(word)
        end
        it "render the show templete" do
            expect(response).to render_template(:show)
        end
    end
end
