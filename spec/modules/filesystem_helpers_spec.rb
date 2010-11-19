require "spec_helper"
include FilesystemHelpers

describe "FilesystemHelpers" do
  describe "compress_folder" do
    before do
      @compress_path = Rails.root.join("spec", "modules").to_s
      p @compress_path
    end
    it "should compress a folder and return the correct path" do
      new_path = compress_folder(@compress_path)
      File.exists?(new_path.to_s).should be_true
    end

    after do
      File.delete(@compress_path.to_s + ".tar")
    end
  end
end
