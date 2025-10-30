# frozen_string_literal: true

class ConvertStorageProviderToS3 < ActiveRecord::Migration[7.2]
  def up
    ActiveStorage::Blob.where(service_name: 'amazon').update_all(service_name: 's3')
  end

  def down
    raise ActiveRecord::IrreversibleMigration('The service name cannot be changed.')
  end
end
