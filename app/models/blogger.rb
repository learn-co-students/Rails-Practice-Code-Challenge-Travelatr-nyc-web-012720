class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age , length: { minimum: 1}
    validates :bio, length: { maximum: 30}
    validates :name, :age, :bio, presence: true

    def total_likes
        likes = self.posts.map do |blogger|
            blogger.likes
        end.sum
    end

    def self.most_likes
       blogger = Post.all.map{|post| post.blogger_id }.max
       result = Blogger.find(blogger) 
    end

    def top_five_likes
      result = self.destinations.sort_by{|dest| Post.where(destination_id: dest.id).count }
      result.reverse
    end
end