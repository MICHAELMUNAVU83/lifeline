defmodule LifelineWeb.FoodAllergyLive.Index do
  use LifelineWeb, :live_view

  alias Lifeline.FoodAllergies
  alias Lifeline.FoodAllergies.FoodAllergy
  alias Lifeline.Users

  @impl true
  def mount(_params, session, socket) do
    user = Users.get_user_by_session_token(session["user_token"])

    {:ok,
     socket
     |> assign(:food_allergies, list_food_allergies())
     |> assign(:user, user)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Food allergy")
    |> assign(:food_allergy, FoodAllergies.get_food_allergy!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Food allergy")
    |> assign(:food_allergy, %FoodAllergy{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Food allergies")
    |> assign(:food_allergy, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    food_allergy = FoodAllergies.get_food_allergy!(id)
    {:ok, _} = FoodAllergies.delete_food_allergy(food_allergy)

    {:noreply, assign(socket, :food_allergies, list_food_allergies())}
  end

  defp list_food_allergies do
    FoodAllergies.list_food_allergies()
  end
end
