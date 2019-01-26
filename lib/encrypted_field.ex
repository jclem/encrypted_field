defmodule EncryptedField do
  @moduledoc """
  An encrypted field for use in an Ecto Schema

      defmodule MyApp.User do
        use Ecto.Schema

        schema "users" do
          field :token, EncryptedField
        end
      end
  """

  import EncryptedField.Encryption

  @behaviour Ecto.Type

  @impl Ecto.Type
  @spec type() :: :string
  def type, do: :string

  @impl Ecto.Type
  @spec cast(any()) :: {:ok, String.t() | nil}
  def cast(nil), do: {:ok, nil}
  def cast(value), do: {:ok, to_string(value)}

  @impl Ecto.Type
  @spec dump(String.t() | nil) :: {:ok, String.t() | nil}
  def dump(nil), do: {:ok, nil}
  def dump(value), do: {:ok, value |> encrypt}

  @impl Ecto.Type
  @spec load(String.t() | nil) :: {:ok, String.t() | nil}
  def load(nil), do: {:ok, nil}
  def load(value), do: {:ok, value |> decrypt}
end
