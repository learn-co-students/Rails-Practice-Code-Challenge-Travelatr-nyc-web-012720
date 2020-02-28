class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_posts
        self.posts.order('created_at DESC')[0..5]
    end

    def most_likes
        likes = self.posts.sort_by do |blogger|
                blogger.likes
        end.last
    end

    def average_age
        average = self.bloggers.map{|blogger| blogger.age}.sum
        result = average/self.bloggers.count
    end
end
