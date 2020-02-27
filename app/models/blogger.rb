class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts 

    validates :name, uniqueness: true
    validates :age, inclusion: {in: (1..120) }
    validates :bio, length: { minimum: 30 } 

    def total_likes
        total = 0 
        self.posts.each do |post|
            total += post.likes 
        end
        total
    end

    def hottest_post
        most_likes = self.posts.map {|post| post.likes}.max
        Post.find_by(likes: most_likes)
    end
end
