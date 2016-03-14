module Contacts
  class SaveInBatch < BaseService

    attr_reader :contactable, :array_of_hashes

    def initialize(contactable, array_of_hashes)
      set_as_valid!
      check_array_of_hashes(array_of_hashes)
      @contactable = contactable
      @array_of_hashes = array_of_hashes
      @errors = []
    end

    def call
      array_of_hashes.each_with_index do |contact_attributes, index|
        contact_attributes.merge!(contactable: contactable)
        contact = Contact.new(contact_attributes)
        unless contact.save
          set_as_invalid!
          add_errors(contact, index)
        end
      end
      valid?
    end

    def contactable_contacts
      contactable.contacts
    end

    private

    def add_errors(contact, index)
      hash = { index: index}
      contact.errors.each do |k,v|
        hash[k] = v
      end
      @errors << hash
    end

  end
end