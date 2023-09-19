defmodule LifelineWeb.DrugAllergyLiveTest do
  use LifelineWeb.ConnCase

  import Phoenix.LiveViewTest
  import Lifeline.DrugAllergiesFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_drug_allergy(_) do
    drug_allergy = drug_allergy_fixture()
    %{drug_allergy: drug_allergy}
  end

  describe "Index" do
    setup [:create_drug_allergy]

    test "lists all drug_allergies", %{conn: conn, drug_allergy: drug_allergy} do
      {:ok, _index_live, html} = live(conn, Routes.drug_allergy_index_path(conn, :index))

      assert html =~ "Listing Drug allergies"
      assert html =~ drug_allergy.name
    end

    test "saves new drug_allergy", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.drug_allergy_index_path(conn, :index))

      assert index_live |> element("a", "New Drug allergy") |> render_click() =~
               "New Drug allergy"

      assert_patch(index_live, Routes.drug_allergy_index_path(conn, :new))

      assert index_live
             |> form("#drug_allergy-form", drug_allergy: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#drug_allergy-form", drug_allergy: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.drug_allergy_index_path(conn, :index))

      assert html =~ "Drug allergy created successfully"
      assert html =~ "some name"
    end

    test "updates drug_allergy in listing", %{conn: conn, drug_allergy: drug_allergy} do
      {:ok, index_live, _html} = live(conn, Routes.drug_allergy_index_path(conn, :index))

      assert index_live |> element("#drug_allergy-#{drug_allergy.id} a", "Edit") |> render_click() =~
               "Edit Drug allergy"

      assert_patch(index_live, Routes.drug_allergy_index_path(conn, :edit, drug_allergy))

      assert index_live
             |> form("#drug_allergy-form", drug_allergy: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#drug_allergy-form", drug_allergy: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.drug_allergy_index_path(conn, :index))

      assert html =~ "Drug allergy updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes drug_allergy in listing", %{conn: conn, drug_allergy: drug_allergy} do
      {:ok, index_live, _html} = live(conn, Routes.drug_allergy_index_path(conn, :index))

      assert index_live
             |> element("#drug_allergy-#{drug_allergy.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#drug_allergy-#{drug_allergy.id}")
    end
  end

  describe "Show" do
    setup [:create_drug_allergy]

    test "displays drug_allergy", %{conn: conn, drug_allergy: drug_allergy} do
      {:ok, _show_live, html} =
        live(conn, Routes.drug_allergy_show_path(conn, :show, drug_allergy))

      assert html =~ "Show Drug allergy"
      assert html =~ drug_allergy.name
    end

    test "updates drug_allergy within modal", %{conn: conn, drug_allergy: drug_allergy} do
      {:ok, show_live, _html} =
        live(conn, Routes.drug_allergy_show_path(conn, :show, drug_allergy))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Drug allergy"

      assert_patch(show_live, Routes.drug_allergy_show_path(conn, :edit, drug_allergy))

      assert show_live
             |> form("#drug_allergy-form", drug_allergy: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#drug_allergy-form", drug_allergy: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.drug_allergy_show_path(conn, :show, drug_allergy))

      assert html =~ "Drug allergy updated successfully"
      assert html =~ "some updated name"
    end
  end
end
