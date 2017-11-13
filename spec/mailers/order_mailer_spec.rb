require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  describe "quote_price" do
    let(:mail) { OrderMailer.quote_price }

    it "renders the headers" do
      expect(mail.subject).to eq("Quote price")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
