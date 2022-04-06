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
        
        context "When user is sign in" do
            let!(:user) { create(:user) }
            
            before do
                sign_in(user)
                get :new 
            end

            it "assigns @word" do
                expect(assigns(:word)).to be_a_new(Word)
            end
            it "render the new templete" do
                expect(response).to render_template("new")
            end
            it do
                expect(response).to have_http_status(200)
            end
        end

        context "When user is not sign in" do
            before do
                get :new 
            end

            it "does not assigns @word" do
                expect(assigns(:word)).to eq(nil)
            end
            it "does not render the new templete" do
                expect(response).not_to render_template("new")
            end
            it do
                expect(response).to have_http_status(302)
            end
        end
    end

    describe "POST create" do
        subject { post :create, params: params }
        
        context "If user is sign in" do
            let!(:user) { create(:user) }
            before { sign_in(user) }

            context "valid params" do
                let!(:language) { create(:language) }
                let(:params) do
                    { word: { content: 'cat', language_id: language.id } } 
                end

                it "create new word" do
                    expect { subject }.to change(Word, :count).from(0).to(1)
                end

                it do
                    subject
                    expect(response).to have_http_status(302)
                end
            end
            context "invalid params" do
                let(:params) do
                    { word: { content: ''  } } 
                end

                it "Does not create new word" do
                    expect { subject }.not_to change(Word, :count)
                end

                it do
                    subject
                    expect(response).to have_http_status(200)
                end
            end
        end

        context "If user is NOT sign in" do
            context "valid params" do
                let!(:language) { create(:language) }
                let(:params) do
                    { word: { content: 'cat', language_id: language.id } } 
                end

                it "Does not create new word" do
                    expect { subject }.not_to change(Word, :count)
                end

                it do
                    subject
                    expect(response).to have_http_status(302)
                end
            end
            context "invalid params" do
                let(:params) do
                    { word: { content: ''  } } 
                end

                it "Does not create new word" do
                    expect { subject }.not_to change(Word, :count)
                end

                it do
                    subject
                    expect(response).to have_http_status(302)
                end
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

    describe "GET edit " do
        before { get :edit, params: params }
        
        let(:params) do
            { id: word.id }
        end

        let!(:word) { create(:word) } 

        it "assign @word" do
            expect(assigns(:word)).to eq(word)
        end
        it "render the edit templete" do
            expect(response).to render_template(:edit)
        end
    end

    describe "PUT update" do
        subject { put :update, params: params }

        let!(:word) { create(:word, content: 'cat', language: language_1) }
        let!(:language_1) { create(:language, name: 'English') }
        let!(:language_2) { create(:language, name: 'German') }

        context "valid params" do
            let(:params) do
                { id: word.id,  word: { content: 'dog', language_id: language_2.id } } 
            end
            it "update word" do
                expect { subject }
                .to change{ word.reload.content }
                .from('cat')
                .to('dog')
                .and change{ word.reload.language }
                .from(language_1)
                .to(language_2)
            end
            # it "update word" do
            #     expect { subject }.to change{ word.reload.content }.from('cat').to('dog')
            # end
            # it "update language" do
            #     expect { subject }
            #     .to change{ word.reload.language }
            #     .from(language_1).to(language_2)
            # end
        end
        context "invalid params" do
            let(:params) do
                { id: word.id,  word: { content: '' } } 
            end
            it "Does not update word" do
                expect { subject }.not_to change{ word.reload.content }
            end
        end
    end

    describe "DELETE destroy" do
        subject { delete :destroy, params: params }

        let!(:word) { create(:word) }

        context "valid params" do
            let(:params) do
                { id: word.id } 
            end
            it "delete word" do
                expect { subject }.to change(Word, :count).from(1).to(0) 
            end
        end
    end
end
