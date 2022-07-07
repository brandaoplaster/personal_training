defmodule PersonalTraining.MemberFixture do
  alias PersonalTraining.{Members, Teachers}

  def valid_attrs,
    do: %{
      "avatar_url" => "https://apler.org.br/wp-content/uploads/2015/11/personal.jpg",
      "birth_date" => "1991-03-10",
      "blood" => "AB-",
      "email" => "teste@teste",
      "height" => "100",
      "name" => "Teste ",
      "teacher_id" => get_teacher(),
      "weight" => "100"
    }

  def update_attrs,
    do: %{
      "avatar_url" => "https://apler.org.br/wp-content/uploads/2015/11/personal.jpg",
      "birth_date" => "1991-03-10",
      "blood" => "AB-",
      "email" => "update@teste",
      "height" => "100",
      "name" => "update ",
      "teacher_id" => get_teacher(),
      "weight" => "100"
    }

  def invalid_attrs,
    do: %{
      "avatar_url" => "",
      "birth_date" => "",
      "blood" => "",
      "email" => "",
      "height" => "",
      "name" => " ",
      "teacher_id" => get_teacher(),
      "weight" => ""
    }

  def member_fixture(attrs \\ %{}) do
    {:ok, member} =
      attrs
      |> Enum.into(valid_attrs())
      |> Members.create_member()

    member
  end

  def get_teacher do
    {:ok, teacher} =
      %{
        avatar_url: "some avatar_url",
        birth_date: ~D[1991-03-10],
        class_type: "some class_type",
        education_level: "some education_level",
        name: "some name"
      }
      |> Teachers.create_teacher()

    teacher.id
  end
end
