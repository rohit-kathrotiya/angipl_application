require 'rails_helper'

RSpec.describe WordsController, type: :controller do
    describe "GET index" do
        context "some words are present" do
            it "assigns @words" do
                word = create(:word)
                get :index
                expect(assigns(:words)).to eq([word])
            end
        end
        context "some words are not present" do
            it "assigns @words" do
                get :index
                expect(assigns(:words)).to eq([])
            end
        end

        it "renders the index template" do
            get :index
            expect(response).to render_template("index")
        end
      end
end
