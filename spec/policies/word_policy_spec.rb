require 'rails_helper'

describe WordPolicy do
    subject { described_class }
  
    permissions :update?, :edit?, :destroy? do
        context "If words belongs to user" do
            let!(:word) { build_stubbed(:word, user: user) }
            let!(:user) { build_stubbed(:user) }
            it "Grant access" do
                expect(subject).to permit(user, word)
            end
        end
        context "If words not belongs to user" do
            let!(:word) { build_stubbed(:word) }
            let!(:user) { build_stubbed(:user) }
            it "Denied access" do
                expect(subject).not_to permit(user, word)
            end
        end
    end
end
