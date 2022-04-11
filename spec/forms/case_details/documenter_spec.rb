# frozen_string_literal: true

require "rails_helper"

module CaseDetails
  describe Documenter, type: :model do
    describe "attributes" do
      subject { described_class.new }

      it { expect(subject).to respond_to(:first_name) }
      it { expect(subject).to respond_to(:last_name) }
      it { expect(subject).to respond_to(:organization_name) }
      it { expect(subject).to respond_to(:reference_number) }
      it { expect(subject).to respond_to(:primary_data) }
      it { expect(subject).to respond_to(:phone_number) }
      it { expect(subject).to respond_to(:website_links) }
      it { expect(subject).to respond_to(:submission_date_month) }
      it { expect(subject).to respond_to(:submission_date_day) }
      it { expect(subject).to respond_to(:submission_date_year) }
      it { expect(subject).to respond_to(:email) }
    end

    describe "validations" do
      subject { described_class.new }

      it { expect(subject).to validate_presence_of :first_name }
      it { expect(subject).to validate_presence_of :last_name }
      it { expect(subject).to validate_presence_of :organization_name }
      it { expect(subject).to validate_presence_of :submission_date_month }
      it { expect(subject).to validate_presence_of :submission_date_day }
      it { expect(subject).to validate_presence_of :submission_date_year }
    end

    describe "process" do
      context "with valid attributes" do
        let!(:params) do
          {
            first_name:            Faker::Name.first_name,
            last_name:             Faker::Name.last_name,
            email:                 Faker::Internet.unique.email,
            phone_number:          "0965-2754-123",
            organization_name:     Faker::Company.name,
            submission_date_day:   1,
            submission_date_month: "January",
            submission_date_year:  Date.current.year,
            reference_number:      SecureRandom.uuid,
            primary_data:          true,
          }
        end

        it "creates a User" do
          described_class.new(params).process!
          user = User.find_by(email: params[:email])

          expect(user).not_to eql nil
        end
      end
    end
  end
end
