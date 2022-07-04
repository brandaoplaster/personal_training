defmodule PersonalTrainingWeb.TeacherController do
  use PersonalTrainingWeb, :controller

  alias PersonalTraining.{Teachers, Teachers.Teacher}

  def index(conn, _params) do
    teachers = Teachers.list_teacher()
    render(conn, "index.html", teachers: teachers)
  end

  def show(conn, %{"id" => id}) do
    teacher = Teachers.get_teacher!(id)
    render(conn, "show.html", teacher: teacher)
  end

  def new(conn, _) do
    changeset = Teachers.change_teacher(%Teacher{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"teacher" => params}) do
    case Teachers.create_teacher(params) do
      {:ok, teacher} ->
        conn
        |> put_flash(:info, "teacher created successfully!")
        |> redirect(to: Routes.teacher_path(conn, :show, teacher))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    teacher = Teachers.get_teacher!(id)
    changeset = Teachers.change_teacher(teacher)

    conn
    |> render("edit.html", teacher: teacher, changeset: changeset)
  end

  def update(conn, %{"id" => id, "teacher" => params}) do
    teacher = Teachers.get_teacher!(id)

    case Teachers.update_teacher(teacher, params) do
      {:ok, teacher} ->
        conn
        |> put_flash(:info, "Teacher updated successfully!")
        |> redirect(to: Routes.teacher_path(conn, :show, teacher))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> render("edit.html", teacher: teacher, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    teacher = Teachers.get_teacher!(id)
    {:ok, _} = Teachers.delete_teacher(teacher)

    conn
    |> put_flash(:info, "Teacher deleted successfully!")
    |> redirect(to: Routes.teacher_path(conn, :index))
  end

  def search(conn, _params) do
    teachers = Teachers.list_teacher()
    render(conn, "index.html", teachers: teachers)
  end
end
