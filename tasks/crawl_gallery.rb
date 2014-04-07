class CrawlGallery
  include Sidekiq::Worker
  def perform(gallery_name, client_id)
    page = 0
    data = get_data(gallery_name, page, client_id)
    while !data.empty?
      page+=1
      data.each do |result|
        if result.is_album
          StoreAlbum.perform_async(result)
        else
          StoreImage.perform_async(result)
        end
      end
      data = get_data(gallery_name, page, client_id)
    end
  end
  
  def get_data(gallery_name, page, client_id)
    JSON.parse(RestClient::Request.execute(
       :method => :get,
       :url => "https://api.imgur.com/3/gallery/hot/#{gallery_name}/#{page.to_s}.json",
       :headers => {:authorization => "Client-ID #{client_id}"}
    )).data
  end
end
