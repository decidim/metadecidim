# frozen_string_literal: true

# This migration comes from decidim_forms (originally 20170511092231)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class CreateDecidimFormsQuestionnaires < ActiveRecord::Migration[5.0]
  def change
    create_table :decidim_forms_questionnaires do |t|
      t.jsonb :title
      t.jsonb :description
      t.jsonb :tos
      t.references :questionnaire_for, polymorphic: true, index: { name: "index_decidim_forms_questionnaires_questionnaire_for" }
      t.datetime :published_at

      t.timestamps
    end
  end
end
