# frozen_string_literal: true

# This migration comes from decidim_surveys (originally 20180406201818)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:39 UTC
class AddPositionToDecidimSurveyAnswerChoices < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_surveys_survey_answer_choices, :position, :integer
  end
end
