defmodule LifelineWeb.FoodAllergyLiveTest do
  use LifelineWeb.ConnCase

  import Phoenix.LiveViewTest
  import Lifeline.FoodAllergiesFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_food_allergy(_) do
    food_allergy = food_allergy_fixture()
    %{food_allergy: food_allergy}
  end

  describe "Index" do
    setup [:create_food_allergy]

    test "lists all food_allergies", %{conn: conn, food_allergy: food_allergy} do
      {:ok, _index_live, html} = live(conn, Routes.food_allergy_index_path(conn, :index))

      assert html =~ "Listing Food allergies"
      assert html =~ food_allergy.name
    end

    test "saves new food_allergy", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.food_allergy_index_path(conn, :index))

      assert index_live |> element("a", "New Food allergy") |> render_click() =~
               "New Food allergy"

      assert_patch(index_live, Routes.food_allergy_index_path(conn, :new))

      assert index_live
             |> form("#food_allergy-form", food_allergy: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#food_allergy-form", food_allergy: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.food_allergy_index_path(conn, :index))

      assert html =~ "Food allergy created successfully"
      assert html =~ "some name"
    end

    test "updates food_allergy in listing", %{conn: conn, food_allergy: food_allergy} do
      {:ok, index_live, _html} = live(conn, Routes.food_allergy_index_path(conn, :index))

      assert index_live |> element("#food_allergy-#{food_allergy.id} a", "Edit") |> render_click() =~
               "Edit Food allergy"

      assert_patch(index_live, Routes.food_allergy_index_path(conn, :edit, food_allergy))

      assert index_live
             |> form("#food_allergy-form", food_allergy: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#food_allergy-form", food_allergy: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.food_allergy_index_path(conn, :index))

      assert html =~ "Food allergy updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes food_allergy in listing", %{conn: conn, food_allergy: food_allergy} do
      {:ok, index_live, _html} = live(conn, Routes.food_allergy_index_path(conn, :index))

      assert index_live
             |> element("#food_allergy-#{food_allergy.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#food_allergy-#{food_allergy.id}")
    end
  end

  describe "Show" do
    setup [:create_food_allergy]

    test "displays food_allergy", %{conn: conn, food_allergy: food_allergy} do
      {:ok, _show_live, html} =
        live(conn, Routes.food_allergy_show_path(conn, :show, food_allergy))

      assert html =~ "Show Food allergy"
      assert html =~ food_allergy.name
    end

    test "updates food_allergy within modal", %{conn: conn, food_allergy: food_allergy} do
      {:ok, show_live, _html} =
        live(conn, Routes.food_allergy_show_path(conn, :show, food_allergy))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Food allergy"

      assert_patch(show_live, Routes.food_allergy_show_path(conn, :edit, food_allergy))

      assert show_live
             |> form("#food_allergy-form", food_allergy: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#food_allergy-form", food_allergy: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.food_allergy_show_path(conn, :show, food_allergy))

      assert html =~ "Food allergy updated successfully"
      assert html =~ "some updated name"
    end
  end
end
