require 'test_helper'

class ContactUsMailerTest < ActionMailer::TestCase
  test "send_message" do
    mail = ContactUsMailer.send_message
    assert_equal "Send message", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
