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

# A provider to manage Compute Engine resources.
class GlobalAddress < GcpResourceBase
  name 'google_compute_global_address'
  desc 'GlobalAddress'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :address
  attr_reader :creation_timestamp
  attr_reader :description
  attr_reader :id
  attr_reader :name
  attr_reader :ip_version
  attr_reader :region
  attr_reader :prefix_length
  attr_reader :address_type
  attr_reader :purpose
  attr_reader :network

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @address = @fetched['address']
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @description = @fetched['description']
    @id = @fetched['id']
    @name = @fetched['name']
    @ip_version = @fetched['ipVersion']
    @region = @fetched['region']
    @prefix_length = @fetched['prefixLength']
    @address_type = @fetched['addressType']
    @purpose = @fetched['purpose']
    @network = @fetched['network']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "GlobalAddress #{@params[:name]}"
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/global/addresses/{{name}}'
  end
end
