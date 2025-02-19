# frozen_string_literal: true

# This migration comes from decidim_surveys (originally 20170524122229)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:39 UTC
class AddQuestionTypeToSurveysQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_surveys_survey_questions, :question_type, :string
  end
end
