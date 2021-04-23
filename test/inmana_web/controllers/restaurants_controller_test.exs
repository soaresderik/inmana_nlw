defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "when all params are valid, create the user", %{conn: conn} do
      params = %{name: "Siri cascudo", email: "siri@cascudo"}

      response =
       conn
         |> post(Routes.restaurants_path(conn, :create, params))
         |> json_response(:created)

      assert %{
        "message" => "Restaurant Created",
        "restaurant" => %{
          "email" => "siri@cascudo",
          "id" => _id,
          "name" => "Siri cascudo"}
      } = response
    end

    test "when all params are valid, returns a error", %{conn: conn} do
      params = %{email: "siri@cascudo"}

      expected =  %{"message" => %{"name" => ["can't be blank"]}}

      response =
       conn
         |> post(Routes.restaurants_path(conn, :create, params))
         |> json_response(:bad_request)

      assert response == expected
    end
  end
end
