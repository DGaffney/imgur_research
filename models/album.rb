class Album
  include MongoMapper::Document
  key :imgur_id, String
  key :title, String
  key :description, String
  key :datetime, Integer
  key :cover, String
  key :cover_width, Integer
  key :cover_height, Integer
  key :account_url, String
  key :privacy, String
  key :layout, String
  key :views, Integer
  key :favorite, Boolean
  key :nsfw, Boolean
  key :section, String
  key :link, String
  key :ups, Integer
  key :downs, Integer
  key :score, Integer
  key :is_album, Boolean
  key :vote, String
end
# Album.ensure_index(:imgur_id)