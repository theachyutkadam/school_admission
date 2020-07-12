require 'rails_helper'

RSpec.describe Role, type: :model do
  context '#create' do
    it 'should create new role' do
      Role.create({name: 'student'})
      expect(Role.count).to eq(1)
    end

    it 'it should not create role if name is empty' do
      role = Role.new({name: ''})
      role.save
      expect(Role.count).to eq(0)
    end

    it 'it should give error message if name is empty' do
      role = Role.new({name: ''})
      role.save
      expect(role.errors.messages[:name].first).to eq("can't be blank")
    end
  end

  context "#student?" do
    it "should return true if role is student" do
      role = Role.new({name: "student"})
      is_student = role.student?
      expect(is_student).to be_truthy
    end

    it "should return false if role is not student" do
      role = Role.new({name: "teacher"})
      is_student = role.student?
      expect(is_student).to be_falsey
    end
  end
end