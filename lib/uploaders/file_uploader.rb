class FileUploader

  def self.store(file, product_id)
    path = "uploads/#{product_id}"

    begin
      Dir.new(path)
    rescue
      Dir.mkdir(path)
    ensure
      File.open("#{path}/#{file}", "w")
    end
  end
end