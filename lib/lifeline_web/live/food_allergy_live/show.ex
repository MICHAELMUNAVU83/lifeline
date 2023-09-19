defmodule LifelineWeb.FoodAllergyLive.Show do
  use LifelineWeb, :live_view

  alias Lifeline.FoodAllergies

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:food_allergy, FoodAllergies.get_food_allergy!(id))}
  end

  defp page_title(:show), do: "Show Food allergy"
  defp page_title(:edit), do: "Edit Food allergy"
end
