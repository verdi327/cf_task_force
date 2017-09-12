class Buttercms::CategoriesController < Buttercms::BaseController
  def show
  	@categories = ButterCMS::Category.all(include: "recent_posts", exclude_body: true)
    @category = ButterCMS::Category.find(params[:slug], :include => :recent_posts)
  end
end