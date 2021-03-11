defmodule PersonalWeb.TwilioReceiverController do
  use PersonalWeb, :controller

  def show(conn, _params) do
    account_sid = Application.fetch_env!(:ex_twilio, :account_sid)

    token =
      ExTwilio.Capability.new()
      |> ExTwilio.Capability.allow_client_incoming(account_sid)
      |> ExTwilio.Capability.token()

    render(conn, "show.html", token: token)
  end

  # Note: By default, Twilio will POST to this endpoint
  def voice(conn, _params) do
    resp = Personal.Twiml.dial_jenny()

    conn
    |> put_resp_content_type("text/xml")
    |> text(resp)
  end
end

defmodule Personal.Twiml do
  import ExTwiml

  def dial_jenny do
    account_sid = Application.fetch_env!(:ex_twilio, :account_sid)

    twiml do
      # This should be your Twilio Number or verified Caller ID
      dial callerid: "+1XXXXXXXXXX" do
        client(account_sid)
      end
    end
  end
end
