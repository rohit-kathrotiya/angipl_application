class WordPolicy
    attr_reader :user, :word
  
    def initialize(user, word)
        @user = user
        @word = word
    end
  
    def edit?
        user_is_authorized_or_not?
    end

    def update?
        user_is_authorized_or_not?
    end

    def destroy?
        user_is_authorized_or_not?
    end

    private

    def user_is_authorized_or_not?
        user == word.user
    end
end