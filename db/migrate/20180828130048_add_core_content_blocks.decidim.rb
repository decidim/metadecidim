# frozen_string_literal: true
# This migration comes from decidim (originally 20180730071851)

class AddCoreContentBlocks < ActiveRecord::Migration[5.2]
  class Organization < ApplicationRecord
    self.table_name = :decidim_organizations
  end
  def change
    Organization.find_each do |organization|
      Decidim::System::CreateDefaultContentBlocks.call(organization)
    end
  end
end
