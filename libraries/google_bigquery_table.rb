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
require 'google/bigquery/property/table_encryption_configuration'
require 'google/bigquery/property/table_external_data_configuration'
require 'google/bigquery/property/table_external_data_configuration_bigtable_options'
require 'google/bigquery/property/table_external_data_configuration_bigtable_options_column_families'
require 'google/bigquery/property/table_external_data_configuration_csv_options'
require 'google/bigquery/property/table_external_data_configuration_google_sheets_options'
require 'google/bigquery/property/table_external_data_configuration_schema'
require 'google/bigquery/property/table_external_data_configuration_schema_fields'
require 'google/bigquery/property/table_schema'
require 'google/bigquery/property/table_schema_fields'
require 'google/bigquery/property/table_streaming_buffer'
require 'google/bigquery/property/table_table_reference'
require 'google/bigquery/property/table_time_partitioning'
require 'google/bigquery/property/table_view'
require 'google/bigquery/property/table_view_user_defined_function_resources'

# A provider to manage BigQuery resources.
class Table < GcpResourceBase
  name 'google_bigquery_table'
  desc 'Table'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :table_reference
  attr_reader :clustering
  attr_reader :creation_time
  attr_reader :description
  attr_reader :friendly_name
  attr_reader :id
  attr_reader :labels
  attr_reader :last_modified_time
  attr_reader :location
  attr_reader :name
  attr_reader :num_bytes
  attr_reader :num_long_term_bytes
  attr_reader :num_rows
  attr_reader :require_partition_filter
  attr_reader :type
  attr_reader :view
  attr_reader :time_partitioning
  attr_reader :streaming_buffer
  attr_reader :schema
  attr_reader :encryption_configuration
  attr_reader :expiration_time
  attr_reader :external_data_configuration
  attr_reader :dataset

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @table_reference = GoogleInSpec::BigQuery::Property::TableTableReference.new(@fetched['tableReference'], to_s)
    @clustering = @fetched['clustering']
    @creation_time = @fetched['creationTime']
    @description = @fetched['description']
    @friendly_name = @fetched['friendlyName']
    @id = @fetched['id']
    @labels = @fetched['labels']
    @last_modified_time = @fetched['lastModifiedTime']
    @location = @fetched['location']
    @name = @fetched['name']
    @num_bytes = @fetched['numBytes']
    @num_long_term_bytes = @fetched['numLongTermBytes']
    @num_rows = @fetched['numRows']
    @require_partition_filter = @fetched['requirePartitionFilter']
    @type = @fetched['type']
    @view = GoogleInSpec::BigQuery::Property::TableView.new(@fetched['view'], to_s)
    @time_partitioning = GoogleInSpec::BigQuery::Property::TableTimePartitioning.new(@fetched['timePartitioning'], to_s)
    @streaming_buffer = GoogleInSpec::BigQuery::Property::TableStreamingBuffer.new(@fetched['streamingBuffer'], to_s)
    @schema = GoogleInSpec::BigQuery::Property::TableSchema.new(@fetched['schema'], to_s)
    @encryption_configuration = GoogleInSpec::BigQuery::Property::TableEncryptionConfiguration.new(@fetched['encryptionConfiguration'], to_s)
    @expiration_time = @fetched['expirationTime']
    @external_data_configuration = GoogleInSpec::BigQuery::Property::TableExternalDataConfiguration.new(@fetched['externalDataConfiguration'], to_s)
    @dataset = @fetched['dataset']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Table #{@params[:name]}"
  end

  private

  def product_url
    'https://www.googleapis.com/bigquery/v2/'
  end

  def resource_base_url
    'projects/{{project}}/datasets/{{dataset}}/tables/{{name}}'
  end
end
