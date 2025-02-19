# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
require 'gcp_backend'
class Snapshots < GcpResourceBase
  name 'google_compute_snapshots'
  desc 'Snapshot plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:disk_size_gbs, field: :disk_size_gb)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:storage_bytes, field: :storage_bytes)
  filter_table_config.add(:licenses, field: :licenses)
  filter_table_config.add(:labels, field: :labels)
  filter_table_config.add(:label_fingerprints, field: :label_fingerprint)
  filter_table_config.add(:source_disks, field: :source_disk)
  filter_table_config.add(:zones, field: :zone)
  filter_table_config.add(:snapshot_encryption_keys, field: :snapshot_encryption_key)
  filter_table_config.add(:source_disk_encryption_keys, field: :source_disk_encryption_key)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('items')
  end

  def fetch_wrapped_resource(wrap_path)
    # fetch_resource returns an array of responses (to handle pagination)
    result = @connection.fetch_all(product_url, resource_base_url, @params, 'Get')
    return if result.nil?

    # Conversion of string -> object hash to symbol -> object hash that InSpec needs
    converted = []
    result.each do |response|
      next if response.nil? || !response.key?(wrap_path)
      response[wrap_path].each do |hash|
        hash_with_symbols = {}
        hash.each_key do |key|
          name, value = transform(key, hash)
          hash_with_symbols[name] = value
        end
        converted.push(hash_with_symbols)
      end
    end

    converted
  end

  def transform(key, value)
    return transformers[key].call(value) if transformers.key?(key)

    [key.to_sym, value]
  end

  def transformers
    {
      'creationTimestamp' => ->(obj) { return :creation_timestamp, parse_time_string(obj['creationTimestamp']) },
      'id' => ->(obj) { return :id, obj['id'] },
      'diskSizeGb' => ->(obj) { return :disk_size_gb, obj['diskSizeGb'] },
      'name' => ->(obj) { return :name, obj['name'] },
      'description' => ->(obj) { return :description, obj['description'] },
      'storageBytes' => ->(obj) { return :storage_bytes, obj['storageBytes'] },
      'licenses' => ->(obj) { return :licenses, obj['licenses'] },
      'labels' => ->(obj) { return :labels, obj['labels'] },
      'labelFingerprint' => ->(obj) { return :label_fingerprint, obj['labelFingerprint'] },
      'sourceDisk' => ->(obj) { return :source_disk, obj['sourceDisk'] },
      'zone' => ->(obj) { return :zone, obj['zone'] },
      'snapshotEncryptionKey' => ->(obj) { return :snapshot_encryption_key, GoogleInSpec::Compute::Property::SnapshotSnapshotEncryptionKey.new(obj['snapshotEncryptionKey'], to_s) },
      'sourceDiskEncryptionKey' => ->(obj) { return :source_disk_encryption_key, GoogleInSpec::Compute::Property::SnapshotSourceDiskEncryptionKey.new(obj['sourceDiskEncryptionKey'], to_s) },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/global/snapshots'
  end
end
