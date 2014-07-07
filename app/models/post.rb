class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable

  def publish!
    published = true
    save!
  end

  def self.create_from_postmark(mitt)
    api_token = mitt.from #.split("@").first.split("+").last
    user = User.find_by_email(api_token)
    if user
      post = user.posts.new
      #binding.pry
      #post.message_id = mitt.message_id
      post.title      = mitt.subject
      post.body = if mitt.tet_body.blank?
        mitt.html_body
      else
        mitt.text_body
      end
      # post.photo = mitt.attachemnts.first.read unless mitt.attachments.empty?
      post.save
    else
      return false
    end
  end
end
