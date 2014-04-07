class StoreImage
  include Sidekiq::Worker
  def perform(raw)
    image = Image.first_or_create(imgur_id: raw.id)
    image.update_attributes(raw)
  end
end
