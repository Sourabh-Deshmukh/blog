class AdminemailMailer < ApplicationMailer
	
	def pverify(user,post)
		@user = user
		@post = post
		
		mail(to: @user, subject: "Verification details",body: "hello #{@user}, Your post #{@post.title} is verified")
	end

  def ccreate(user,post_title, comment)
    @user = user
    @post_title= post_title
		@comment = comment
		
		mail(to: @user, subject: "Comment creation details",body: "hello #{@user}, Your post #{@post_title} is commented") 
  end	
end
