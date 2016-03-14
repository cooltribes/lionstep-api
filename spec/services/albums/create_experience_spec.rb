require 'rails_helper'

RSpec.describe Albums::CreateAlbum, type: :service do
  let!(:current_user){ User.make!(:confirmed) }
  let(:album_params) do
    {
      name: "New Album",
    }
  end

  describe "#call" do
    context "with albumable info" do
      it "should create a album for albumable" do
        albumable = current_user
        expect {
          Albums::CreateAlbum.new(current_user, albumable, album_params).call
        }.to change(Album, :count).by(1)
        expect(Album.last.albumable).to eq(albumable)
      end
    end
  end

end