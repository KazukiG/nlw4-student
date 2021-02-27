defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Rafael",
        password: "123456",
        nickname: "camarda",
        email: "rafael@banana.com",
        age: 27
      }

      {:ok %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Rafael", age: 27, id: ^user_id} = user
    end

    test "when there are invalid params, returns an user" do
      params = %{
        name: "Rafael",
        password: "123456",
        nickname: "camarda",
        email: "rafael@banana.com",
        age: 27
      }

      {:error changeset} = Create.call(params)

      assert errors_on(changeset) == expected_response
    end
  end
end
