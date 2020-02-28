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

#     def most_destination
#         #find the likes quantity for each country
#         #sort by the most to less
#         #conver that to obj
#         result = []
#         # count = Hash.new
#         self.destinations.each do |post|
#             post_count = Post.where(destination_id: post.id).count 

#             end
#        end
#        result
#     end
end


{:object => 1}
