class Product

  attr_accessor :database

  def initialize
    @database = []
  end

  def create(data)
    data[:id] = database.empty? ? '1' : database.last[:id].next
    return "Complete the fields" if is_valid?(data)
    database << data
  end

  def count
    database.count
  end

  def find(id) 
    data = find_by(id)
    data ? data : "Invalid ID"
  end

  def update(id, data)
    return "Invalid ID" unless find_by(id) unless is_key?(data).empty?
    return "Complete the fields" if is_valid?(data)
    database.each do |product|
      if product[:id].eql?(id)
        data.keys.each { |key| product[key] = data[key] }
      end
    end
  end

  def where(value)
    products  = database.select { |product| product[:name].eql?(value) || product[:value].eql?(value) || product[:brand].eql?(value)}
    products.any? ? products : "No matches were found"
  end

  def all
    database
  end

  def delete(id) 
    return "Invalid ID" unless find_by(id)
    database.delete_if { |value| value[:id].eql?(id)}
  end

  private

  def is_valid?(data)
    data[:name].eql?('') || data[:value].eql?('') || data[:brand].eql?('')
  end

  def find_by(id)
    data = database.select { |product| product[:id].eql?(id) }[0]
  end

  def is_key?(data)
    data.keys.select { |key| key.eql?(:name) || key.eql?(:value) || key.eql?(:brand) }
  end

end

#----------------------TEST---------------------#

require 'minitest/autorun'

describe Product do

  before do
    @database = Product.new
    @database.create({name: 'Manzana', value: '1500', brand: 'Colombina', description: ' ', quantity: '2'})
  end

  describe "#Create" do
    describe "When creating a product" do
      it "must respond positively" do
        @database.create({name: 'Chocolate', value: '1500', brand: 'Colombina', description: ' ', quantity: '2'}).must_equal(
        [{:name=>"Manzana", :value=>"1500", :brand=>"Colombina", :description=>" ", :quantity=>"2", :id=>"1"},
        {:name=>"Chocolate", :value=>"1500", :brand=>"Colombina", :description=>" ", :quantity=>"2", :id=>"2"}])
      end
    end

    describe "when creating a product without the fields required" do
      it "must respond negatively if the name is missing" do
        @database.create({name: '', value: '2000', brand: 'Colechera', description: ' ', quantity: '2'}).must_equal("Complete the fields")
      end

      it "must respond negatively if the value is missing" do
        @database.create({name: 'Alpin', value: '', brand: 'Alpina', description: ' ', quantity: '2'}).must_equal("Complete the fields")
      end

      it "must respond negatively if the brand is missing" do
        @database.create({name: 'Gatorade', value: '2500', brand: '', description: ' ', quantity: '2'}).must_equal("Complete the fields")
      end
    end
  end

  describe "#Count" do
    describe "when get the size of the array" do
      it "must show a number" do
        @database.count.must_equal(1)
      end
    end
  end

  describe "#Find" do
    describe "when looking for a data by valid ID" do
      it "must gets the data of product" do
        @database.find("1").must_equal({:name=>"Manzana", :value=>"1500", :brand=>"Colombina", :description=>" ", :quantity=>"2", :id=>"1"})
      end
    end

    describe "when looking for a data by invalid ID" do
      it "must gets a message of error" do
        @database.find("3").must_equal("Invalid ID")
      end
    end
  end

  describe "#Update" do
    describe "when the data of a product is updated" do
      it "must respond positively" do 
        @database.update("1", {value: '2500', description: 'Manzana recubierta de caramelo', quantity: '20'}).must_equal(
        [{:name=>"Manzana", :value=>"2500", :brand=>"Colombina", :description=>"Manzana recubierta de caramelo", :quantity=>"20", :id=>"1"}])
      end
    end

    describe "when the data of product if updating without the fields required" do
      it "must respond negatively if the name is missing" do
        @database.update("1",{name: '', value: '2500', quantity: '20'}).must_equal("Complete the fields")
      end

      it "must respond negatively if the value is missing" do
        @database.update("1",{value: '', description: 'Manzana recubierta de caramelo', quantity: '20'}).must_equal("Complete the fields")
      end

      it "must respond negatively if the brand is missing" do 
        @database.update("1",{value: '2500', brand: '', description: 'Manzana recubierta de caramelo', quantity: '20'}).must_equal("Complete the fields")
      end
    end

    describe "when updating with an invalid ID" do 
      it "must gets a message of error" do 
        @database.update("10",{value: '2500',description: 'Manzana recubierta de caramelo', quantity: '20'}).must_equal("Invalid ID")
      end
    end
  end

  describe "#Where" do
    describe "when filtered with the parameters name, value or brand" do
      it "must gets the data that matches the name" do
        @database.where("Manzana").must_equal([{:name=>"Manzana", :value=>"1500", :brand=>"Colombina", :description=>" ", :quantity=>"2", :id=>"1"}])
      end

      it "must gets the data that matches the value" do
        @database.where("1500").must_equal([{:name=>"Manzana", :value=>"1500", :brand=>"Colombina", :description=>" ", :quantity=>"2", :id=>"1"}])
      end

      it "must gest the data that matches the brand" do
        @database.where("Colombina").must_equal([{:name=>"Manzana", :value=>"1500", :brand=>"Colombina", :description=>" ", :quantity=>"2", :id=>"1"}])
      end
    end

    describe "when filtered with the parameters name, value or brand and can not find matches" do
      it "must gets a message of error" do 
        @database.where("Helado").must_equal("No matches were found")
      end
    end
  end

  describe "#All" do
    describe "when getting all the products saved" do
      it "muts show all the data" do
        @database.all.must_equal([{:name=>"Manzana", :value=>"1500", :brand=>"Colombina", :description=>" ", :quantity=>"2", :id=>"1"}])
      end
    end
  end

  describe "#Delete" do
    describe "when deleted a product" do
      it "must respond positively" do
        @database.delete("1").must_equal([])
      end
    end

    describe "when a product with invalid ID is deleted" do
      it "must respond negatively" do
        @database.delete("10").must_equal("Invalid ID")
      end
    end
  end

end
