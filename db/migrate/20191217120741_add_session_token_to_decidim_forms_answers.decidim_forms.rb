# frozen_string_literal: true

# This migration comes from decidim_forms (originally 20190315203056)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddSessionTokenToDecidimFormsAnswers < ActiveRecord::Migration[5.2]
  class Answer < ApplicationRecord
    self.table_name = :decidim_forms_answers
  end

  def change
    add_column :decidim_forms_answers, :session_token, :string, null: false, default: ""
    add_index :decidim_forms_answers, :session_token

    Answer.find_each do |answer|
      answer.session_token = Digest::MD5.hexdigest("#{answer.decidim_user_id}-#{Rails.application.secret_key_base}")
      answer.save!
    end
  end
end
