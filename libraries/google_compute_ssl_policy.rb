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
require 'google/compute/property/sslpolicy_warnings'

# A provider to manage Compute Engine resources.
class SslPolicy < GcpResourceBase
  name 'google_compute_ssl_policy'
  desc 'SslPolicy'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :creation_timestamp
  attr_reader :description
  attr_reader :id
  attr_reader :name
  attr_reader :profile
  attr_reader :min_tls_version
  attr_reader :enabled_features
  attr_reader :custom_features
  attr_reader :fingerprint
  attr_reader :warnings

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @description = @fetched['description']
    @id = @fetched['id']
    @name = @fetched['name']
    @profile = @fetched['profile']
    @min_tls_version = @fetched['minTlsVersion']
    @enabled_features = @fetched['enabledFeatures']
    @custom_features = @fetched['customFeatures']
    @fingerprint = @fetched['fingerprint']
    @warnings = GoogleInSpec::Compute::Property::SslPolicyWarningsArray.parse(@fetched['warnings'], to_s)
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "SslPolicy #{@params[:name]}"
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/global/sslPolicies/{{name}}'
  end
end
