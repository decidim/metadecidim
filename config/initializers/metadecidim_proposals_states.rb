# frozen_string_literal: true

# Monkey patch to have a custom announcement color in proposals answers
Rails.application.config.to_prepare do
  Decidim::Proposals::ProposalsHelper.module_eval do
    def proposal_reason_callout_class
      case @proposal.state
      when "accepted"
        "finished"
      when "evaluating"
        "progressing"
      when "rejected"
        "alert"
      else
        ""
      end
    end

    def proposal_reason_callout_title
      i18n_key = case @proposal.state
                 when "evaluating"
                   "proposal_in_evaluation_reason"
                 else
                   "proposal_#{@proposal.state}_reason"
                 end

      t(i18n_key, scope: "decidim.proposals.proposals.show")
    end
  end
end

# Monkey patch to have a custom label color in proposals metadata (i.e. in index lists)
Rails.application.config.to_prepare do
  Decidim::Proposals::ProposalMetadataCell.class_eval do
    private

    def state_class
      case state
      when "accepted"
        "finished"
      when "rejected", "withdrawn"
        "alert"
      when "evaluating"
        "progressing"
      else
        "muted"
      end
    end
  end
end
