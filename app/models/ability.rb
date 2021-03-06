class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new #guest user

		#debug: determine why user is getting set as null
		if user.role? :admin
		    can :manage, :all
		else
			can :manage, :all #for testing purposes only
			#can :read, :all
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
