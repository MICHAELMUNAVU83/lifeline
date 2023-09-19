defmodule LifelineWeb.DrugAllergyLive.FormComponent do
  use LifelineWeb, :live_component

  alias Lifeline.DrugAllergies

  @impl true
  def update(%{drug_allergy: drug_allergy} = assigns, socket) do
    changeset = DrugAllergies.change_drug_allergy(drug_allergy)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"drug_allergy" => drug_allergy_params}, socket) do
    changeset =
      socket.assigns.drug_allergy
      |> DrugAllergies.change_drug_allergy(drug_allergy_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"drug_allergy" => drug_allergy_params}, socket) do
    save_drug_allergy(socket, socket.assigns.action, drug_allergy_params)
  end

  defp save_drug_allergy(socket, :edit, drug_allergy_params) do
    case DrugAllergies.update_drug_allergy(socket.assigns.drug_allergy, drug_allergy_params) do
      {:ok, _drug_allergy} ->
        {:noreply,
         socket
         |> put_flash(:info, "Drug allergy updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_drug_allergy(socket, :adddrugallergy, drug_allergy_params) do
    case DrugAllergies.create_drug_allergy(drug_allergy_params) do
      {:ok, _drug_allergy} ->
        {:noreply,
         socket
         |> put_flash(:info, "Drug allergy created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
