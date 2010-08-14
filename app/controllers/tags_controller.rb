class TagsController < InheritedResources::Base
  actions :show

  show! do |format|
    if @tag
      params[:nav] = params[:nav] || "posts"
      @children = @tag.send(params[:nav]).includes(:user, :tags).paginate(:page => params[:page], :per_page => 10)
    else
      format.html { render_404 }
    end
  end

  protected
    def resource
      @tag = ActsAsTaggableOn::Tag.find_by_name(params[:id])
    end
end
