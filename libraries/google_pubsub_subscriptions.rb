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
class Subscriptions < GcpResourceBase
  name 'google_pubsub_subscriptions'
  desc 'Subscription plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:topics, field: :topic)
  filter_table_config.add(:labels, field: :labels)
  filter_table_config.add(:push_configs, field: :push_config)
  filter_table_config.add(:ack_deadline_seconds, field: :ack_deadline_seconds)
  filter_table_config.add(:message_retention_durations, field: :message_retention_duration)
  filter_table_config.add(:retain_acked_messages, field: :retain_acked_messages)
  filter_table_config.add(:expiration_policies, field: :expiration_policy)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('subscriptions')
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
      'name' => ->(obj) { return :name, name_from_self_link(obj['name']) },
      'topic' => ->(obj) { return :topic, obj['topic'] },
      'labels' => ->(obj) { return :labels, obj['labels'] },
      'pushConfig' => ->(obj) { return :push_config, GoogleInSpec::Pubsub::Property::SubscriptionPushConfig.new(obj['pushConfig'], to_s) },
      'ackDeadlineSeconds' => ->(obj) { return :ack_deadline_seconds, obj['ackDeadlineSeconds'] },
      'messageRetentionDuration' => ->(obj) { return :message_retention_duration, obj['messageRetentionDuration'] },
      'retainAckedMessages' => ->(obj) { return :retain_acked_messages, obj['retainAckedMessages'] },
      'expirationPolicy' => ->(obj) { return :expiration_policy, GoogleInSpec::Pubsub::Property::SubscriptionExpirationPolicy.new(obj['expirationPolicy'], to_s) },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  private

  def product_url
    'https://pubsub.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/subscriptions'
  end
end
