defmodule LifelineWeb.PageLive.Index do
  use LifelineWeb, :live_view
  alias Lifeline.NextOfKins
  alias Lifeline.NextOfKins.NextofKin
  alias Lifeline.FoodAllergies
  alias Lifeline.FoodAllergies.FoodAllergy
  alias Lifeline.DrugAllergies
  alias Lifeline.DrugAllergies.DrugAllergy

  def mount(_params, _session, socket) do
    {:ok, socket}
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

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Next of kins")
  end
end
