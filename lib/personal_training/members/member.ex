defmodule PersonalTraining.Members.Member do
  use Ecto.Schema
  import Ecto.Changeset

  schema "members" do
    field :birth_date, :date
    field :blood, :string
    field :email, :string
    field :height, :string
    field :name, :string
    field :weight, :string
    field :avatar_url, :string
    belongs_to :teacher, PersonalTraining.Teachers.Teacher

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:name, :email, :birth_date, :blood, :height, :weight, :avatar_url])
    |> validate_required([:name, :email, :birth_date, :blood, :height, :weight, :avatar_url])
  end
end
