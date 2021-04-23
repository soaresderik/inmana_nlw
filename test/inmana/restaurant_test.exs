defmodule Inmana.RestaurantTest do
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "When all params are valid, returns a valid changeset" do
      params = %{name: "Siri cascudo", email: "siri@cascudo"}

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: true} = response
    end

    test "When all params are valid, returns an invalid changeset" do
      params = %{name: "a", email: ""}
      expected = %{name: ["should be at least 2 character(s)"], email: ["can't be blank"]}

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected
    end
  end
end
