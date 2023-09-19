defmodule LifelineWeb.NextofKinLive.FormComponent do
  use LifelineWeb, :live_component

  alias Lifeline.NextOfKins

  @impl true
  def update(%{nextof_kin: nextof_kin} = assigns, socket) do
    changeset = NextOfKins.change_nextof_kin(nextof_kin)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"nextof_kin" => nextof_kin_params}, socket) do
    changeset =
      socket.assigns.nextof_kin
      |> NextOfKins.change_nextof_kin(nextof_kin_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"nextof_kin" => nextof_kin_params}, socket) do
    save_nextof_kin(socket, socket.assigns.action, nextof_kin_params)
  end

  defp save_nextof_kin(socket, :edit_kin, nextof_kin_params) do
    case NextOfKins.update_nextof_kin(socket.assigns.nextof_kin, nextof_kin_params) do
      {:ok, _nextof_kin} ->
        {:noreply,
         socket
         |> put_flash(:info, "Nextof kin updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_nextof_kin(socket, :addnextofkin, nextof_kin_params) do
    new_kin_params =
      nextof_kin_params
      |> Map.put("user_id", socket.assigns.current_user.id)

    case NextOfKins.create_nextof_kin(new_kin_params) do
      {:ok, _nextof_kin} ->
        {:noreply,
         socket
         |> put_flash(:info, "Nextof kin created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
