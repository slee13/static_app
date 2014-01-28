

module UsersHelper

	# Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 45 })
    #gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    default_url = "https://assets.github.com/images/gravatars/gravatar-140.png"

    if(user.present?)
        gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
        gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
    else
      gravatar_url = default_url
  end
  image_tag(gravatar_url, alt: user.name, class: "gravatar")
 end

end