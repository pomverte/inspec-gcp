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
class RegionalClusters < GcpResourceBase
  name 'google_container_regional_clusters'
  desc 'RegionalCluster plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:initial_node_counts, field: :initial_node_count)
  filter_table_config.add(:node_configs, field: :node_config)
  filter_table_config.add(:master_auths, field: :master_auth)
  filter_table_config.add(:logging_services, field: :logging_service)
  filter_table_config.add(:monitoring_services, field: :monitoring_service)
  filter_table_config.add(:networks, field: :network)
  filter_table_config.add(:private_cluster_configs, field: :private_cluster_config)
  filter_table_config.add(:cluster_ipv4_cidrs, field: :cluster_ipv4_cidr)
  filter_table_config.add(:addons_configs, field: :addons_config)
  filter_table_config.add(:subnetworks, field: :subnetwork)
  filter_table_config.add(:locations, field: :locations)
  filter_table_config.add(:resource_labels, field: :resource_labels)
  filter_table_config.add(:label_fingerprints, field: :label_fingerprint)
  filter_table_config.add(:legacy_abacs, field: :legacy_abac)
  filter_table_config.add(:network_policies, field: :network_policy)
  filter_table_config.add(:default_max_pods_constraints, field: :default_max_pods_constraint)
  filter_table_config.add(:ip_allocation_policies, field: :ip_allocation_policy)
  filter_table_config.add(:endpoints, field: :endpoint)
  filter_table_config.add(:initial_cluster_versions, field: :initial_cluster_version)
  filter_table_config.add(:current_master_versions, field: :current_master_version)
  filter_table_config.add(:current_node_versions, field: :current_node_version)
  filter_table_config.add(:create_times, field: :create_time)
  filter_table_config.add(:statuses, field: :status)
  filter_table_config.add(:status_messages, field: :status_message)
  filter_table_config.add(:node_ipv4_cidr_sizes, field: :node_ipv4_cidr_size)
  filter_table_config.add(:services_ipv4_cidrs, field: :services_ipv4_cidr)
  filter_table_config.add(:current_node_counts, field: :current_node_count)
  filter_table_config.add(:expire_times, field: :expire_time)
  filter_table_config.add(:enable_tpus, field: :enable_tpu)
  filter_table_config.add(:tpu_ipv4_cidr_blocks, field: :tpu_ipv4_cidr_block)
  filter_table_config.add(:conditions, field: :conditions)
  filter_table_config.add(:master_authorized_networks_configs, field: :master_authorized_networks_config)
  filter_table_config.add(:locations, field: :location)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('clusters')
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
      'name' => ->(obj) { return :name, obj['name'] },
      'description' => ->(obj) { return :description, obj['description'] },
      'initialNodeCount' => ->(obj) { return :initial_node_count, obj['initialNodeCount'] },
      'nodeConfig' => ->(obj) { return :node_config, GoogleInSpec::Container::Property::RegionalClusterNodeConfig.new(obj['nodeConfig'], to_s) },
      'masterAuth' => ->(obj) { return :master_auth, GoogleInSpec::Container::Property::RegionalClusterMasterAuth.new(obj['masterAuth'], to_s) },
      'loggingService' => ->(obj) { return :logging_service, obj['loggingService'] },
      'monitoringService' => ->(obj) { return :monitoring_service, obj['monitoringService'] },
      'network' => ->(obj) { return :network, obj['network'] },
      'privateClusterConfig' => ->(obj) { return :private_cluster_config, GoogleInSpec::Container::Property::RegionalClusterPrivateClusterConfig.new(obj['privateClusterConfig'], to_s) },
      'clusterIpv4Cidr' => ->(obj) { return :cluster_ipv4_cidr, obj['clusterIpv4Cidr'] },
      'addonsConfig' => ->(obj) { return :addons_config, GoogleInSpec::Container::Property::RegionalClusterAddonsConfig.new(obj['addonsConfig'], to_s) },
      'subnetwork' => ->(obj) { return :subnetwork, obj['subnetwork'] },
      'locations' => ->(obj) { return :locations, obj['locations'] },
      'resourceLabels' => ->(obj) { return :resource_labels, obj['resourceLabels'] },
      'labelFingerprint' => ->(obj) { return :label_fingerprint, obj['labelFingerprint'] },
      'legacyAbac' => ->(obj) { return :legacy_abac, GoogleInSpec::Container::Property::RegionalClusterLegacyAbac.new(obj['legacyAbac'], to_s) },
      'networkPolicy' => ->(obj) { return :network_policy, GoogleInSpec::Container::Property::RegionalClusterNetworkPolicy.new(obj['networkPolicy'], to_s) },
      'defaultMaxPodsConstraint' => ->(obj) { return :default_max_pods_constraint, GoogleInSpec::Container::Property::RegionalClusterDefaultMaxPodsConstraint.new(obj['defaultMaxPodsConstraint'], to_s) },
      'ipAllocationPolicy' => ->(obj) { return :ip_allocation_policy, GoogleInSpec::Container::Property::RegionalClusterIpAllocationPolicy.new(obj['ipAllocationPolicy'], to_s) },
      'endpoint' => ->(obj) { return :endpoint, obj['endpoint'] },
      'initialClusterVersion' => ->(obj) { return :initial_cluster_version, obj['initialClusterVersion'] },
      'currentMasterVersion' => ->(obj) { return :current_master_version, obj['currentMasterVersion'] },
      'currentNodeVersion' => ->(obj) { return :current_node_version, obj['currentNodeVersion'] },
      'createTime' => ->(obj) { return :create_time, parse_time_string(obj['createTime']) },
      'status' => ->(obj) { return :status, obj['status'] },
      'statusMessage' => ->(obj) { return :status_message, obj['statusMessage'] },
      'nodeIpv4CidrSize' => ->(obj) { return :node_ipv4_cidr_size, obj['nodeIpv4CidrSize'] },
      'servicesIpv4Cidr' => ->(obj) { return :services_ipv4_cidr, obj['servicesIpv4Cidr'] },
      'currentNodeCount' => ->(obj) { return :current_node_count, obj['currentNodeCount'] },
      'expireTime' => ->(obj) { return :expire_time, parse_time_string(obj['expireTime']) },
      'enableTpu' => ->(obj) { return :enable_tpu, obj['enableTpu'] },
      'tpuIpv4CidrBlock' => ->(obj) { return :tpu_ipv4_cidr_block, obj['tpuIpv4CidrBlock'] },
      'conditions' => ->(obj) { return :conditions, GoogleInSpec::Container::Property::RegionalClusterConditionsArray.parse(obj['conditions'], to_s) },
      'masterAuthorizedNetworksConfig' => ->(obj) { return :master_authorized_networks_config, GoogleInSpec::Container::Property::RegionalClusterMasterAuthorizedNetworksConfig.new(obj['masterAuthorizedNetworksConfig'], to_s) },
      'location' => ->(obj) { return :location, obj['location'] },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  private

  def product_url
    'https://container.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/locations/{{location}}/clusters'
  end
end
