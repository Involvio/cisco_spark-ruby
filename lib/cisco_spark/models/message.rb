require "cisco_spark/model"

module CiscoSpark
  class Message
    include Model
    resource 'messages'

    attributes(
      id: DataCaster::String,
      room_id: DataCaster::String,
      room_type: DataCaster::String,
      text: DataCaster::String,
      person_id: DataCaster::String,
      person_email: DataCaster::String,
      html: DataCaster::String,
      files: DataCaster::Array,
      created: DataCaster::DateTime,
      parent_id: DataCaster::String,
    )

    def person
      CiscoSpark::Person.fetch(person_id)
    end

    def person_to
      CiscoSpark::Person.fetch(to_person_id)
    end
  end
end
