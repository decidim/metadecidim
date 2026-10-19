# frozen_string_literal: true

require "rails_helper"

# We make sure that the checksum of the file overridden is the same
# as the expected. If this test fails, it means that the overridden
# file should be updated to match any change/bug fix introduced in the core
checksums = [
  {
    package: "decidim-core",
    files: {
      "/app/serializers/decidim/exporters/open_data_blocked_user_serializer.rb" => "f7937948950748c6bd172ba443c9fa86", # fall back to the latest UserBlock when block_id is missing (users blocked with 0.27.3)
      "/app/serializers/decidim/exporters/open_data_moderation_serializer.rb" => "fc864db582f525d507eda9b206f1489d" # empty reported_url when the reported content cannot be loaded (removed modules, trashed components)
    }
  }
]

describe "Overridden files", type: :view do
  checksums.each do |item|
    gem_spec = Gem::Specification.find_by_name(item[:package])
    next unless gem_spec

    item[:files].each do |file, signature|
      it "#{gem_spec.gem_dir}#{file} matches checksum" do
        gem_dir = Gem::Specification.find_by_name(item[:package]).gem_dir
        expect(md5("#{gem_dir}#{file}")).to eq(signature)
      end
    end
  end

  private

  def md5(file)
    Digest::MD5.hexdigest(File.read(file))
  end
end
