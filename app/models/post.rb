class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, :inclusion => { :in => ['Fiction', 'Non-Fiction']}

    validate :title_is_clickbait?

    Title_strings = [
        /Won't Believe/,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]

    def title_is_clickbait?
        if Title_strings.none? { |t| t.match title}
         errors.add(:title, "title is clickbait")
        end
    end
   

end
