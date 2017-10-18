require 'rails_helper'

describe Contact do
  describe "validations" do
    it "is invalid without a name" do
      contact = Contact.new(position: "Manager", email: "email")

      expect(contact).to be_invalid
    end

    it "is invalid without a position" do
      contact = Contact.new(name: "Miguel", email: "email")

      expect(contact).to be_invalid
    end

    it "is invalid without a email" do
      contact = Contact.new(name: "Miguel", position: "Manager")

      expect(contact).to be_invalid
    end

    it "is valid" do
      company = Company.create(name: "ESPN")
      contact = Contact.new(name: "Miguel", position: "Manager", email: "email", company_id: company.id)

      expect(contact).to be_valid
    end
  end

  describe "relationships" do
    it "responds to Company" do
      contact = Contact.new(name: "Miguel", position: "Manager", email: "email")

      expect(contact).to respond_to(:company)
    end

  end
end
