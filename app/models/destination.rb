class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    validates :name, :country, presence: true 

    def hottest_post
        most_likes = self.posts.map {|post| post.likes}.max
        Post.find_by(likes: most_likes)
    end

    def average_age
        if self.bloggers.first 
            total_age = self.unique_bloggers.map {|b|b.age}.sum
            average = total_age/self.unique_bloggers.count 
            return average
        else
            "This destination does not have any posts from any bloggers."
        end
    end

    def unique_bloggers
        self.bloggers.uniq
    end

end
