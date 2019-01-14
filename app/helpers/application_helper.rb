module ApplicationHelper

	def article_liked?(article_id)
		if Like.exists?(:user_id => current_user.id, :article_id => article_id)
			return true
		else
			return false
		end
	end
	
end
