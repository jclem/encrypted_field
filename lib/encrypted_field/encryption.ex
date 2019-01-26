defmodule EncryptedField.Encryption do
  @moduledoc """
  Encrypts and decrypts values
  """

  @doc """
  Decrypt a value.

      iex> encrypted = EncryptedField.Encryption.encrypt("secret value")
      iex> EncryptedField.Encryption.decrypt(encrypted)
      "secret value"
  """
  def decrypt("") do
    ""
  end

  def decrypt(ciphertext) do
    <<iv::binary-16, ciphertext::binary>> = ciphertext |> Base.decode64!()
    state = :crypto.stream_init(:aes_ctr, key(), iv)
    {_state, plaintext} = :crypto.stream_decrypt(state, ciphertext)
    plaintext
  end

  @doc """
  Encrypt a value using AES in CTR mode.

      EncryptedField.Encryption.encrypt("secret value")
  """
  def encrypt(plaintext) do
    iv = :crypto.strong_rand_bytes(16)
    state = :crypto.stream_init(:aes_ctr, key(), iv)
    {_state, ciphertext} = :crypto.stream_encrypt(state, plaintext)
    (iv <> ciphertext) |> Base.encode64()
  end

  defp key do
    case Application.get_env(:encrypted_field, :key) do
      key when is_binary(key) ->
        key

      {:system, system_key} ->
        System.get_env(system_key)
    end
  end
end
