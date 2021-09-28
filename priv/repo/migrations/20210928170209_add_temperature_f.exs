defmodule WeatherTracker.Repo.Migrations.AddTemperatureF do
  use Ecto.Migration

  def change do
    alter table(:weather_conditions) do
      add :temperature_f, :decimal
    end
  end
end
