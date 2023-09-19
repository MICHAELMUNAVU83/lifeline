defmodule LifelineWeb.FoodAllergyLive.FormComponent do
  use LifelineWeb, :live_component

  alias Lifeline.FoodAllergies

  @impl true
  def update(%{food_allergy: food_allergy} = assigns, socket) do
    changeset = FoodAllergies.change_food_allergy(food_allergy)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"food_allergy" => food_allergy_params}, socket) do
    changeset =
      socket.assigns.food_allergy
      |> FoodAllergies.change_food_allergy(food_allergy_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"food_allergy" => food_allergy_params}, socket) do
    save_food_allergy(socket, socket.assigns.action, food_allergy_params)
  end

  defp save_food_allergy(socket, :edit, food_allergy_params) do
    case FoodAllergies.update_food_allergy(socket.assigns.food_allergy, food_allergy_params) do
      {:ok, _food_allergy} ->
        {:noreply,
         socket
         |> put_flash(:info, "Food allergy updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_food_allergy(socket, :addfoodallergy, food_allergy_params) do
    case FoodAllergies.create_food_allergy(food_allergy_params) do
      {:ok, _food_allergy} ->
        {:noreply,
         socket
         |> put_flash(:info, "Food allergy created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
