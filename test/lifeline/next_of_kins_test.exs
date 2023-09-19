defmodule Lifeline.NextOfKinsTest do
  use Lifeline.DataCase

  alias Lifeline.NextOfKins

  describe "next_of_kins" do
    alias Lifeline.NextOfKins.NextofKin

    import Lifeline.NextOfKinsFixtures

    @invalid_attrs %{name: nil, relation: nil, phone_number: nil}

    test "list_next_of_kins/0 returns all next_of_kins" do
      nextof_kin = nextof_kin_fixture()
      assert NextOfKins.list_next_of_kins() == [nextof_kin]
    end

    test "get_nextof_kin!/1 returns the nextof_kin with given id" do
      nextof_kin = nextof_kin_fixture()
      assert NextOfKins.get_nextof_kin!(nextof_kin.id) == nextof_kin
    end

    test "create_nextof_kin/1 with valid data creates a nextof_kin" do
      valid_attrs = %{
        name: "some name",
        relation: "some relation",
        phone_number: "some phone_number"
      }

      assert {:ok, %NextofKin{} = nextof_kin} = NextOfKins.create_nextof_kin(valid_attrs)
      assert nextof_kin.name == "some name"
      assert nextof_kin.relation == "some relation"
      assert nextof_kin.phone_number == "some phone_number"
    end

    test "create_nextof_kin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = NextOfKins.create_nextof_kin(@invalid_attrs)
    end

    test "update_nextof_kin/2 with valid data updates the nextof_kin" do
      nextof_kin = nextof_kin_fixture()

      update_attrs = %{
        name: "some updated name",
        relation: "some updated relation",
        phone_number: "some updated phone_number"
      }

      assert {:ok, %NextofKin{} = nextof_kin} =
               NextOfKins.update_nextof_kin(nextof_kin, update_attrs)

      assert nextof_kin.name == "some updated name"
      assert nextof_kin.relation == "some updated relation"
      assert nextof_kin.phone_number == "some updated phone_number"
    end

    test "update_nextof_kin/2 with invalid data returns error changeset" do
      nextof_kin = nextof_kin_fixture()

      assert {:error, %Ecto.Changeset{}} =
               NextOfKins.update_nextof_kin(nextof_kin, @invalid_attrs)

      assert nextof_kin == NextOfKins.get_nextof_kin!(nextof_kin.id)
    end

    test "delete_nextof_kin/1 deletes the nextof_kin" do
      nextof_kin = nextof_kin_fixture()
      assert {:ok, %NextofKin{}} = NextOfKins.delete_nextof_kin(nextof_kin)
      assert_raise Ecto.NoResultsError, fn -> NextOfKins.get_nextof_kin!(nextof_kin.id) end
    end

    test "change_nextof_kin/1 returns a nextof_kin changeset" do
      nextof_kin = nextof_kin_fixture()
      assert %Ecto.Changeset{} = NextOfKins.change_nextof_kin(nextof_kin)
    end
  end
end
