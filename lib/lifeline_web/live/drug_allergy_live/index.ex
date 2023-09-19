defmodule LifelineWeb.DrugAllergyLive.Index do
  use LifelineWeb, :live_view

  alias Lifeline.DrugAllergies
  alias Lifeline.DrugAllergies.DrugAllergy
  alias Lifeline.Users

  @impl true
  def mount(_params, session, socket) do
    user = Users.get_user_by_session_token(session["user_token"])

    {:ok,
     socket
     |> assign(:drug_allergies, list_drug_allergies())
     |> assign(:current_user, user)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Drug allergy")
    |> assign(:drug_allergy, DrugAllergies.get_drug_allergy!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Drug allergy")
    |> assign(:drug_allergy, %DrugAllergy{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Drug allergies")
    |> assign(:drug_allergy, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    drug_allergy = DrugAllergies.get_drug_allergy!(id)
    {:ok, _} = DrugAllergies.delete_drug_allergy(drug_allergy)

    {:noreply, assign(socket, :drug_allergies, list_drug_allergies())}
  end

  defp list_drug_allergies do
    DrugAllergies.list_drug_allergies()
  end
end
