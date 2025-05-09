# frozen_string_literal: true

# This migration comes from decidim (originally 20171212103803)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class CreateUniqueNicknames < ActiveRecord::Migration[5.1]
  class User < ApplicationRecord
    include Decidim::Nicknamizable

    self.table_name = :decidim_users
  end

  def up
    add_column :decidim_users, :nickname, :string, limit: 20

    User.where.not(name: nil).find_each do |user|
      user.update!(nickname: UserBaseEntity.nicknamize(user.name, decidim_organization_id: user.decidim_organization_id))
    end

    add_index :decidim_users,
              %w(nickname decidim_organization_id),
              where: "(deleted_at IS NULL) AND (managed = 'f')",
              name: "index_decidim_users_on_nickame_and_decidim_organization_id",
              unique: true
  end

  def down
    remove_index :decidim_users, %w(nickname decidim_organization_id)

    remove_column :decidim_users, :nickname
  end
end
