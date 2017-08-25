# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://cigarcitycrossfit.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

add personal_training_services_path, :changefreq => "monthly", :priority => 0.5
add crossfit_classes_services_path, :changefreq => "monthly", :priority => 0.5
add individual_design_services_path, :changefreq => "monthly", :priority => 0.5
add nutrition_planning_services_path, :changefreq => "monthly", :priority => 0.5
add crossfit_academy_services_path, :changefreq => "monthly", :priority => 0.5
add inbody_scan_services_path, :changefreq => "monthly", :priority => 0.5
add specialty_courses_services_path, :changefreq => "monthly", :priority => 0.5

add wod_path, :changefreq => "daily", :priority => 0.6
add schedule_path, :changefreq => "monthly", :priority => 0.7
add contact_us_path, :changefreq => "monthly", :priority => 0.7
add shit_we_like_path, :changefreq => "monthly", :priority => 0.3
add ebook_library_path, :changefreq => "monthly", :priority => 0.3
add get_started_path, :changefreq => "weekly", :priority => 1
add faqs_path, :changefreq => "monthly", :priority => 0.5
add book_your_no_sweat_intro_path, :changefreq => "monthly", :priority => 1
add pricing_path, :changefreq => "monthly", :priority => 0.9
add sitemap_path, :changefreq => "monthly", :priority => 0.1
add goal_review_session_path, :changefreq => "monthly", :priority => 0.6
add blog_path, :changefreq => "weekly", :priority => 0.6
add blog_rss_path, :changefreq => "monthly", :priority => 0.2
add blog_atom_path, :changefreq => "monthly", :priority => 0.2


#add all blog posts to sitemap
add_to_index blog_sitemap_path, :changefreq => "weekly", :priority => 0.1
end
