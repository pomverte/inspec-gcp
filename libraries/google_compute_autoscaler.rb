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
require 'google/compute/property/autoscaler_autoscaling_policy'
require 'google/compute/property/autoscaler_autoscaling_policy_cpu_utilization'
require 'google/compute/property/autoscaler_autoscaling_policy_custom_metric_utilizations'
require 'google/compute/property/autoscaler_autoscaling_policy_load_balancing_utilization'

# A provider to manage Compute Engine resources.
class Autoscaler < GcpResourceBase
  name 'google_compute_autoscaler'
  desc 'Autoscaler'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :id
  attr_reader :creation_timestamp
  attr_reader :name
  attr_reader :description
  attr_reader :autoscaling_policy
  attr_reader :target
  attr_reader :zone

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @id = @fetched['id']
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @name = @fetched['name']
    @description = @fetched['description']
    @autoscaling_policy = GoogleInSpec::Compute::Property::AutoscalerAutoscalingPolicy.new(@fetched['autoscalingPolicy'], to_s)
    @target = @fetched['target']
    @zone = @fetched['zone']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Autoscaler #{@params[:name]}"
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/zones/{{zone}}/autoscalers/{{name}}'
  end
end
