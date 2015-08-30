class Post < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  has_attached_file :thumbnail, styles: { large: "128x128#", medium: "64x64#" }
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/

  #Getter and Setter for all_tags virtual attribute
  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end


  def self.tag_by_num(id)
    self.tags[:id]
  end


  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end
end
