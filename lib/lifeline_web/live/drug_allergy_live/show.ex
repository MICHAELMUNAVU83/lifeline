defmodule LifelineWeb.DrugAllergyLive.Show do
  use LifelineWeb, :live_view

  alias Lifeline.DrugAllergies

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:drug_allergy, DrugAllergies.get_drug_allergy!(id))}
  end

  defp page_title(:show), do: "Show Drug allergy"
  defp page_title(:edit), do: "Edit Drug allergy"
end
