module DashboardHelper
  def recipe_author(r)
    if r.user.profile.present?
      name = r.user.profile.first_name + ' ' + r.user.profile.last_name
      return link_to name, profile_path(r.user.profile)
    else
      return mail_to r.user.email, r.user.email
    end
  end
end
