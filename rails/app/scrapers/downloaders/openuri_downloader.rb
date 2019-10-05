class OpenuriDownloader << BaseDownloader
  def get(uri)
    open(uri, "User-Agent" => @userAgent ).read
  end

  def get(uri)
    open(uri, "User-Agent" => @userAgent ).open do |f|
      WebPage.create_from_page(f)
    end
  end
end
