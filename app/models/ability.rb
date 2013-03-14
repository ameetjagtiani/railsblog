class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new #guest user

		if user.role? :admin
		    can :manage, :all
		else
			can :read, :all
			#can :create, Comment
			#can :update, Comment
				#comment.try(user) == user || user.role?(:moderator)	
		end
		#if user.role?(:author)
 		#	can :create, Post
 		#	can :update, Post do |post|
 		#		post.try(:user) == user
		#end
	end

end
