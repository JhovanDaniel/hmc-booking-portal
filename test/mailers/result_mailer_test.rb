require "test_helper"

class ResultMailerTest < ActionMailer::TestCase
  test "send_results" do
    mail = ResultMailer.send_results
    assert_equal "Send results", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
