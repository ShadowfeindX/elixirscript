defmodule JS do
  @moduledoc """
  This module defines macros and functions which implement
  JavaScript functionality that may not translate easily to
  Elixir. For instance, creating a new object, or updating
  an existing one.
  """

  @doc """
  Creates new JavaScript objects.

  ex:
    JS.new User, ["first_name", "last_name"]
  """
  def new(module, params) do
  end


  @doc """
  Updates an existing JavaScript object.

  ex:
    JS.update elem, %{"width" => 100}
  """
  def update(object, map) do
  end


  @doc """
  Imports a JavaScript module.

  Elixir modules can use the normal `import`, `alias` and `require`,
  but JavaScript modules work differently and have to be imported
  using this.

  If module is not a list, then it is treated as a default import,
  otherwise it is not.

  ex:
    JS.import A, "a" #translates to "import A from 'a'"

    JS.import [A, B, C], "a" #translates to "import {A, B, C} from 'a'"
  """
  def import(module, from) do
  end

  @doc """
  Returns the type of the given value
  """
  def typeof(value) do
  end

  @doc """
  Determines if value is an instance of type.
  """
  def instanceof(value, type) do
  end

  @doc """
  Throws the term given
  """
  def throw(term) do
  end


  @doc """
  Returns a reference to the global JavaScript object.

  In browsers this would be window or self.
  In node this would be the global object.
  """
  def global() do
    Elixir.Core.Functions.get_global()
  end

  defmacro defgen(call, expr \\ nil) do
  end

  defmacro defgenp(call, expr \\ nil) do
  end

  def is_generator(term) do
    term.constructor.name === "GeneratorFunction"
  end

  def yield() do
  end

  def yield(term) do
  end

  def yield_to(term) do
  end

  @doc """
  Provides a convenient way to create a string-based map.

  Elixirscript, by default turns the following, `%{a: "b"}` into `{[Symbol.for("a")]: "b"}` in JavaScript. In order to get string keys,
  one would have to do `%{"a" => "b"}` which turns into `{a: "b"}` in JavaScript. With `Kernel.object`, you can create string keyed maps
  conveniently, `object(a: "b")` which turns into `{a: "b"}`
  """
  defmacro object(args) do
    args = Enum.map(args, fn
      { k, v } when Kernel.is_atom(k) ->
        { Atom.to_string(k), v }
      pair ->
        pair
    end)

    { :%{}, [], args }
  end
end
