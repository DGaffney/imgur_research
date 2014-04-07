class Image
  include MongoMapper::Document
  key :imgur_id, String
  key :title, String
  key :description, String
  key :datetime, Integer
  key :type, String
  key :animated, Boolean
  key :width, Integer
  key :height, Integer
  key :size, Integer
  key :views, Integer
  key :bandwidth, Integer
  key :favorite, Boolean
  key :nsfw, Boolean
  key :section, String
  key :link, String
end
# Image.ensure_index(:imgur_id)