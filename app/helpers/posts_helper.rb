module PostsHelper
  def tag_links(tags)
    tags.split(",").map{|tag| link_to tag.strip.tr("!@#", ''), tag_path(tag.strip) }.join(", ") 
  end


end
