class StoreAlbum
  include Sidekiq::Worker
  def perform(raw)
    album = Album.first_or_create(imgur_id: raw.id)
    album.update_attributes(raw)
  end
end