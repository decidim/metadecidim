# frozen_string_literal: true

# This migration comes from decidim_surveys (originally 20180405014929)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddChoicesToDecidimSurveyAnswers < ActiveRecord::Migration[5.1]
  class SurveyAnswer < ApplicationRecord
    self.table_name = :decidim_surveys_survey_answers
  end

  class SurveyQuestion < ApplicationRecord
    self.table_name = :decidim_surveys_survey_questions
  end

  def up
    add_column :decidim_surveys_survey_answers, :text_body, :text
    add_column :decidim_surveys_survey_answers, :choices, :jsonb, default: []

    SurveyAnswer.find_each do |answer|
      question = SurveyQuestion.find_by(id: answer.decidim_survey_question_id)

      if %w(single_option multiple_option).include?(question.question_type)
        answer.update!(choices: answer.body)
      else
        answer.update!(text_body: answer.body.first)
      end
    end

    remove_column :decidim_surveys_survey_answers, :body
    rename_column :decidim_surveys_survey_answers, :text_body, :body
  end

  def down
    add_column :decidim_surveys_survey_answers, :jsonb_body, :jsonb, default: []

    SurveyAnswer.find_each do |answer|
      question = SurveyQuestion.find_by(id: answer.decidim_survey_question_id)

      if %w(single_option multiple_option).include?(question.question_type)
        answer.update!(jsonb_body: answer.choices)
      else
        answer.update!(jsonb_body: [answer.body])
      end
    end

    remove_column :decidim_surveys_survey_answers, :choices

    remove_column :decidim_surveys_survey_answers, :body
    rename_column :decidim_surveys_survey_answers, :jsonb_body, :body
  end
end
