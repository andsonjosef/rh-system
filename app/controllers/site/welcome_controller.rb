class Site::WelcomeController < SiteController
  def index
    @jobs = Job.all
  end
end
