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
require 'google/cloudfunctions/property/cloudfunction_event_trigger'
require 'google/cloudfunctions/property/cloudfunction_https_trigger'
require 'google/cloudfunctions/property/cloudfunction_source_repository'

# A provider to manage Cloud Functions resources.
class CloudFunction < GcpResourceBase
  name 'google_cloudfunctions_cloud_function'
  desc 'CloudFunction'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :description
  attr_reader :status
  attr_reader :entry_point
  attr_reader :runtime
  attr_reader :timeout
  attr_reader :available_memory_mb
  attr_reader :service_account_email
  attr_reader :update_time
  attr_reader :version_id
  attr_reader :labels
  attr_reader :environment_variables
  attr_reader :source_archive_url
  attr_reader :source_upload_url
  attr_reader :source_repository
  attr_reader :https_trigger
  attr_reader :event_trigger
  attr_reader :location

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @description = @fetched['description']
    @status = @fetched['status']
    @entry_point = @fetched['entryPoint']
    @runtime = @fetched['runtime']
    @timeout = @fetched['timeout']
    @available_memory_mb = @fetched['availableMemoryMb']
    @service_account_email = @fetched['serviceAccountEmail']
    @update_time = @fetched['updateTime']
    @version_id = @fetched['versionId']
    @labels = @fetched['labels']
    @environment_variables = @fetched['environmentVariables']
    @source_archive_url = @fetched['sourceArchiveUrl']
    @source_upload_url = @fetched['sourceUploadUrl']
    @source_repository = GoogleInSpec::CloudFunctions::Property::CloudFunctionSourceRepository.new(@fetched['sourceRepository'], to_s)
    @https_trigger = GoogleInSpec::CloudFunctions::Property::CloudFunctionHttpsTrigger.new(@fetched['httpsTrigger'], to_s)
    @event_trigger = GoogleInSpec::CloudFunctions::Property::CloudFunctionEventTrigger.new(@fetched['eventTrigger'], to_s)
    @location = @fetched['location']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "CloudFunction #{@params[:name]}"
  end

  private

  def product_url
    'https://cloudfunctions.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/locations/{{location}}/functions/{{name}}'
  end
end
