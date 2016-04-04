module V1::EmailHelper

  def email_image_tag(image, **options)
    attachments.inline[image] = File.read("#{Rails.root}/public/images/#{image}")
    image_tag attachments[image].url, **options
  end
end