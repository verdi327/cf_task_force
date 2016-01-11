Buttercms.configure do |config|
  # If you added the Heroku Butter add-on, ENV["BUTTER_TOKEN"] will be defined.
  # Otherwise, grab your token at https://buttercms.com/api_token and either
  # paste it below or set it on your ENV like so: $ export BUTTER_TOKEN=yourtokenhere"
  config.token = ENV["BUTTER_TOKEN"]

  # Specify a custom layout for your blog so it matches the rest of your site.
  # For example uncomment the line below and define the layout in /view/layout/blog.html.erb
  # You can of course also use your existing main application layout.
  # config.layout = "blog"

  # Specify a custom parent controller for Butter's BlogController to inherit from.
  # By default Butter inherit's from ApplicationController but you can override this with your own
  # controller and tell Butter to use that with this config option.
  # config.parent_controller = "ApplicationController"
end