defmodule PersonalTraining.MembersTest do
  use PersonalTraining.DataCase

  alias PersonalTraining.Members
  import PersonalTraining.MemberFixture

  describe "members" do
    alias PersonalTraining.Members.Member

    test "list_members/0 returns all members" do
      member = member_fixture()
      assert Members.list_members() == [member]
    end

    test "search_member/1 using filters" do
      member_fixture()
      assert Members.search_member("ruby") == []
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Members.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      assert {:ok, %Member{} = member} = Members.create_member(valid_attrs())
      assert member.birth_date == ~D[1991-03-10]
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Members.create_member(invalid_attrs())
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      assert {:ok, %Member{} = member} = Members.update_member(member, update_attrs())
      assert member.birth_date == ~D[1991-03-10]
      assert member.email == "update@teste"
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Members.update_member(member, invalid_attrs())
      assert member == Members.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Members.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Members.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Members.change_member(member)
    end
  end
end
