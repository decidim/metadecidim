# frozen_string_literal: true

# This migration comes from decidim (originally 20181030090144)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class DestroyDeletedUsersFollows < ActiveRecord::Migration[5.2]
  class Follow < ApplicationRecord
    self.table_name = "decidim_follows"
  end

  class User < ApplicationRecord
    self.table_name = "decidim_users"
  end

  def change
    deleted_users = User.where.not(deleted_at: nil).pluck(:id)
    Follow.where(decidim_followable_type: "Decidim::UserBaseEntity", decidim_followable_id: deleted_users).destroy_all
    Follow.where(decidim_user_id: deleted_users).destroy_all
  end
end
