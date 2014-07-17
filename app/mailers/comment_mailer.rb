class CommentMailer < ActionMailer::Base
  default from: "catfriend@catfriend.us"

  def new_comment(comment, commentable)
    @comment = comment
    @commentable = commentable
    mail to: "catfriend@catfriend.us", subject: "whatever"
  end
end