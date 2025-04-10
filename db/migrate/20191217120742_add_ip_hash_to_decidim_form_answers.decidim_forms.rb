# frozen_string_literal: true

# This migration comes from decidim_forms (originally 20190930094710)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddIpHashToDecidimFormAnswers < ActiveRecord::Migration[5.2]
  class Answer < ApplicationRecord
    self.table_name = :decidim_forms_answers
  end

  def change
    add_column :decidim_forms_answers, :ip_hash, :string
    add_index :decidim_forms_answers, :ip_hash
  end
end
