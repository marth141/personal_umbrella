defmodule PersonalWeb.AboutControllerTest do
  use PersonalWeb.ConnCase

  describe "index" do
    test "About page loads", %{conn: conn} do
      conn = get(conn, Routes.about_path(conn, :index))
      assert html_response(conn, 200) =~ "About"
    end
  end
end
