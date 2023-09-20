defmodule LifelineWeb.PageLive.Index do
  use LifelineWeb, :live_view
  alias Lifeline.NextOfKins
  alias Lifeline.NextOfKins.NextofKin
  alias Lifeline.FoodAllergies
  alias Lifeline.FoodAllergies.FoodAllergy
  alias Lifeline.DrugAllergies
  alias Lifeline.DrugAllergies.DrugAllergy
  alias Lifeline.Users

  def mount(_params, session, socket) do
    user = Users.get_user_by_session_token(session["user_token"])
    drug_allergies = DrugAllergies.list_user_drug_allergies(user.id)
    food_allergies = FoodAllergies.list_user_food_allergies(user.id)
    next_of_kin = NextOfKins.list_user_nextofkin(user.id)
    id = Integer.to_string(user.id)
    qrcode_url = "localhost:4000/users/" <> id
    IO.inspect(qrcode_url)

    {:ok,
     socket
     |> assign(:current_user, user)
     |> assign(:drug_allergies, drug_allergies)
     |> assign(:food_allergies, food_allergies)
     |> assign(:nextofkins, next_of_kin)
     |> assign(:qrcode_url, qrcode_url)}
  end

  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :addnextofkin, _params) do
    socket
    |> assign(:nextof_kin, %NextofKin{})
    |> assign(:page_title, "New Nextof kin")
  end

  defp apply_action(socket, :addfoodallergy, _params) do
    socket
    |> assign(:page_title, "New Food allergy")
    |> assign(:food_allergy, %FoodAllergy{})
  end

  defp apply_action(socket, :adddrugallergy, _params) do
    socket
    |> assign(:page_title, "New Drug allergy")
    |> assign(:drug_allergy, %DrugAllergy{})
  end

  defp apply_action(socket, :edit_kin, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Nextof kin")
    |> assign(:nextof_kin, NextOfKins.get_nextof_kin!(id))
  end

  defp apply_action(socket, :edit_drug, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Drug allergy")
    |> assign(:drug_allergy, DrugAllergies.get_drug_allergy!(id))
  end

  def handle_event("deletekin", %{"id" => id}, socket) do
    nextof_kin = NextOfKins.get_nextof_kin!(id)
    {:ok, _} = NextOfKins.delete_nextof_kin(nextof_kin)

    {:noreply, assign(socket, :next_of_kins, NextOfKins.list_next_of_kins())}
  end

  def handle_event("delete_drug", %{"id" => id}, socket) do
    drug_allergy = DrugAllergies.get_drug_allergy!(id)
    {:ok, _} = DrugAllergies.delete_drug_allergy(drug_allergy)

    {:noreply, assign(socket, :drug_allergies, DrugAllergies.list_drug_allergies())}
  end

  def handle_event("delete_food", %{"id" => id}, socket) do
    food_allergy = FoodAllergies.get_food_allergy!(id)
    {:ok, _} = FoodAllergies.delete_food_allergy(food_allergy)

    {:noreply, assign(socket, :food_allergies, FoodAllergies.list_food_allergies())}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Next of kins")
  end
end
