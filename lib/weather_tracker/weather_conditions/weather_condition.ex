defmodule WeatherTracker.WeatherConditions.WeatherCondition do
  use Ecto.Schema
  import Ecto.Changeset

  @allowed_fields [
    :altitude_m,
    :pressure_pa,
    :temperature_c,
    :light_lumens
  ]

  @derive {Jason.Encoder, only: @allowed_fields}
  @primary_key false

  schema "weather_conditions" do
    field :timestamp, :naive_datetime
    field :altitude_m, :decimal
    field :pressure_pa, :decimal
    field :temperature_c, :decimal
    field :light_lumens, :decimal
    field :temperature_f, :decimal
  end

  def create_changeset(weather_condition = %__MODULE__{}, attrs) do
    timestamp =
      NaiveDateTime.utc_now()
      |> NaiveDateTime.truncate(:second)

    weather_condition
    |> cast(attrs, @allowed_fields)
    |> validate_required(@allowed_fields)
    |> put_change(:timestamp, timestamp)
  end
end
