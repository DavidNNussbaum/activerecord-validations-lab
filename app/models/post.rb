class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid size" }
    validate :key_words_present
 

  

    # CLICKBAIT_PATTERNS = [
    #     /Won't Believe/i,
    #     /Secret/i,
    #     /Top [0-9]*/i,
    #     /Guess/i
    #   ]
    
    #   def is_clickbait?
    #     if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
    #       errors.add(:title, "must be clickbait")
    #     end
    #   end

      
      def key_words_present
      array = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
      if array.none? { |item| item.match title}
        errors.add(:title, "Missing key words.")
      end
      end
  end


  
