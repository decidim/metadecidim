# frozen_string_literal: true

# This migration comes from decidim (originally 20180706104107)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddNicknameToManagedUsers < ActiveRecord::Migration[5.2]
  class User < ApplicationRecord
    self.table_name = :decidim_users
  end

  def up
    User.where(managed: true, nickname: nil).includes(:organization).find_each do |user|
      user.nickname = UserBaseEntity.nicknamize(user.name, organization: user.organization)
      user.save
    end
  end
end
