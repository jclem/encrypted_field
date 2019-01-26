# EncryptedField

Provides an encrypted field for use in an Ecto schema.

## Usage

First, configure an encryption key. An easy way to do this is with pwgen
(`brew install pwgen`):

```sh
brew install pwgen
pwgen -1 32
```

You can configure this key at runtime using a `{:system, "key"}` tuple:

```elixir
config :encrypted_field, :key, {:system, "ENCRYPTED_FIELD_KEY"}
```

Then, use it in an Elixir schema:

```elixir
defmodule MyApp.User do
  use Ecto.Schema

  schema "users" do
    field :token, EncryptedField
  end
end
```

When this value is written to the database, it will be encrypted with your
secret key using AES in CTR mode, and Base64-encoded. At runtime, the value will
be decrypted.

## Installation

The package can be installed by adding `encrypted_field` to your list of
dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:encrypted_field, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/encrypted_field](https://hexdocs.pm/encrypted_field).
