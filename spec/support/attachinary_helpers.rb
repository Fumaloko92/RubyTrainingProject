# frozen_string_literal: true
module AttachinaryHelpers
  def cloudinary_fake_data
    [{
      :public_id => "xl6hxxwyzzj5w5oz0e0s",
      :version => 1_466_062_406,
      :signature => "5c3058d3c96da696a22bc18fdcc2a98484314a4f",
      :format => "png",
      :resource_type => "image",
      :url => "http://1.png",
      :secure_url => "https://1.png",
      :original_filename => "filename"
    }].map(&:to_json).map(&:to_s)
  end

  def stub_attachinary_remote_calls
    # to prevent Attachinary to make API calls to cloudinary
    allow_any_instance_of(Attachinary::File).
      to receive(:remove_temporary_tag).
      and_return(true)
  end
end
