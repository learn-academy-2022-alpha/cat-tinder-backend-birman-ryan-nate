require 'rails_helper'

RSpec.describe "Animals", type: :request do
   describe "GET /index" do
     it "gets a list of animals" do
    Animal.create(
        name: 'Felix',
        age: 2,
        enjoys: 'Walks in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )
     get '/animals'
      animal = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(animal.length).to eq 1
    end
  end
  describe "POST /create" do
    it "creates an animal" do
     animal_params = {
          animal: {
             name: 'Felix',
             age: 2,
             enjoys: 'Walks in the park',
             image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
          }
        }
      post '/animals', params: animal_params
      expect(response).to have_http_status(200)       
      animal = Animal.first
      expect(animal.name).to eq 'Felix'
      expect(animal.age).to eq 2
      expect(animal.enjoys).to eq 'Walks in the park'
      expect(animal.image).to eq 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
    end
  end
    describe 'PATCH /update' do
     it 'updates an animal' do
      Animal.create name: 'Felix', age: 2, enjoys: 'Walks in the park', image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        animal_felix = Animal.first
           animal_params = {
            animal: {
            name: 'Jerald',
            age: 3,
            enjoys: 'Walks in the park',
            image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
          }
        }
          patch "/animals/#{animal_felix.id}", params: animal_params
            animal_mystery = Animal.find(animal_felix.id)
              expect(response).to have_http_status(200)
              expect(animal_mystery.name).to eq 'Jerald'
    end
  end
    describe 'DELETE /destroy' do
    it 'deletes an animal' do
      Animal.create name: 'Felix', age: 2,  enjoys: 'Walks in the park', image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      animal_felix = Animal.first
      delete "/animals/#{animal_felix.id}"
      expect(response).to have_http_status(200)
      animals = Animal.all
      expect(animals).to be_empty
  end
  end
end  
