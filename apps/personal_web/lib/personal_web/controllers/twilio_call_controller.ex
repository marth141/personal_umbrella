defmodule PersonalWeb.TwilioCallController do
  use PersonalWeb, :controller

  def show(conn, _params) do
    token =
      ExTwilio.Capability.new()
      |> ExTwilio.Capability.allow_client_outgoing("APabe7650f654fc34655fc81ae71caa3ff")
      |> ExTwilio.Capability.token()

    render(conn, "show.html", token: token)
  end
end
