require "cisco_spark/model"

module CiscoSpark
  class Person
    include Model
    resource 'people'

    attributes(
      id: DataCaster::String,
      emails: DataCaster::Array,
      phone_numbers: DataCaster::Array,
      display_name: DataCaster::String,
      nick_name: DataCaster::String,
      first_name: DataCaster::String,
      last_name: DataCaster::String,
      avatar: DataCaster::String,
      org_id: DataCaster::String,
      created: DataCaster::DateTime,
      last_activity: DataCaster::DateTime,
      status: DataCaster::String,
      type: DataCaster::String,
    )

    def self.all_by_email(email, options={})
      options[:email] = email
      self.fetch_all(options)
    end

    def self.all_by_name(name, options={})
      options[:display_name] = name
      self.fetch_all(options)
    end

    def memberships(options={})
      options[:person_id] = id
      CiscoSpark::Membership.fetch_all(options)
    end
  end
end
