module ResumesHelper

  def file_scan(object)
    object.image.url.scan(/\.[^\.]+$/)[0]
  end

end
