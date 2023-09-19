defmodule LifelineWeb.NextofKinLiveTest do
  use LifelineWeb.ConnCase

  import Phoenix.LiveViewTest
  import Lifeline.NextOfKinsFixtures

  @create_attrs %{name: "some name", relation: "some relation", phone_number: "some phone_number"}
  @update_attrs %{
    name: "some updated name",
    relation: "some updated relation",
    phone_number: "some updated phone_number"
  }
  @invalid_attrs %{name: nil, relation: nil, phone_number: nil}

  defp create_nextof_kin(_) do
    nextof_kin = nextof_kin_fixture()
    %{nextof_kin: nextof_kin}
  end

  describe "Index" do
    setup [:create_nextof_kin]

    test "lists all next_of_kins", %{conn: conn, nextof_kin: nextof_kin} do
      {:ok, _index_live, html} = live(conn, Routes.nextof_kin_index_path(conn, :index))

      assert html =~ "Listing Next of kins"
      assert html =~ nextof_kin.name
    end

    test "saves new nextof_kin", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.nextof_kin_index_path(conn, :index))

      assert index_live |> element("a", "New Nextof kin") |> render_click() =~
               "New Nextof kin"

      assert_patch(index_live, Routes.nextof_kin_index_path(conn, :new))

      assert index_live
             |> form("#nextof_kin-form", nextof_kin: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#nextof_kin-form", nextof_kin: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.nextof_kin_index_path(conn, :index))

      assert html =~ "Nextof kin created successfully"
      assert html =~ "some name"
    end

    test "updates nextof_kin in listing", %{conn: conn, nextof_kin: nextof_kin} do
      {:ok, index_live, _html} = live(conn, Routes.nextof_kin_index_path(conn, :index))

      assert index_live |> element("#nextof_kin-#{nextof_kin.id} a", "Edit") |> render_click() =~
               "Edit Nextof kin"

      assert_patch(index_live, Routes.nextof_kin_index_path(conn, :edit, nextof_kin))

      assert index_live
             |> form("#nextof_kin-form", nextof_kin: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#nextof_kin-form", nextof_kin: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.nextof_kin_index_path(conn, :index))

      assert html =~ "Nextof kin updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes nextof_kin in listing", %{conn: conn, nextof_kin: nextof_kin} do
      {:ok, index_live, _html} = live(conn, Routes.nextof_kin_index_path(conn, :index))

      assert index_live |> element("#nextof_kin-#{nextof_kin.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#nextof_kin-#{nextof_kin.id}")
    end
  end

  describe "Show" do
    setup [:create_nextof_kin]

    test "displays nextof_kin", %{conn: conn, nextof_kin: nextof_kin} do
      {:ok, _show_live, html} = live(conn, Routes.nextof_kin_show_path(conn, :show, nextof_kin))

      assert html =~ "Show Nextof kin"
      assert html =~ nextof_kin.name
    end

    test "updates nextof_kin within modal", %{conn: conn, nextof_kin: nextof_kin} do
      {:ok, show_live, _html} = live(conn, Routes.nextof_kin_show_path(conn, :show, nextof_kin))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Nextof kin"

      assert_patch(show_live, Routes.nextof_kin_show_path(conn, :edit, nextof_kin))

      assert show_live
             |> form("#nextof_kin-form", nextof_kin: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#nextof_kin-form", nextof_kin: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.nextof_kin_show_path(conn, :show, nextof_kin))

      assert html =~ "Nextof kin updated successfully"
      assert html =~ "some updated name"
    end
  end
end
