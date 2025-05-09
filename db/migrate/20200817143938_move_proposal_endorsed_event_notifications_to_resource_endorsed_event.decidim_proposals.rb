# frozen_string_literal: true

# This migration comes from decidim_proposals (originally 20200730131631)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class MoveProposalEndorsedEventNotificationsToResourceEndorsedEvent < ActiveRecord::Migration[5.2]
  def up
    Decidim::Notification.where(event_name: "decidim.events.proposals.proposal_endorsed", event_class: "Decidim::Proposals::ProposalEndorsedEvent").find_each do |notification|
      notification.update(event_name: "decidim.events.resource_endorsed", event_class: "Decidim::ResourceEndorsedEvent")
    end
  end

  def down
    Decidim::Notification.where(
      event_name: "decidim.events.resource_endorsed",
      event_class: "Decidim::ResourceEndorsedEvent",
      decidim_resource_type: "Decidim::Proposals::Proposal"
    )
                         .find_each do |notification|
      notification.update(event_name: "decidim.events.proposals.proposal_endorsed", event_class: "Decidim::Proposals::ProposalEndorsedEvent")
    end
  end
end
