require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "new_review" do
    mail = Notification.new_review
    assert_equal "New review", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
