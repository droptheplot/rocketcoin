defmodule RocketcoinWeb.Api.V1.CurrencyView do
  use RocketcoinWeb, :view

  def render("calc.json", %{result: result}) do
    %{result: result}
  end
end
