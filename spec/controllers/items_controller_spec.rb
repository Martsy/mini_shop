# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Item.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      item = Item.create! valid_attributes
      get :show, params: { id: item.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      item = Item.create! valid_attributes
      get :edit, params: { id: item.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Item' do
        expect do
          post :create, params: { item: valid_attributes }, session: valid_session
        end.to change(Item, :count).by(1)
      end

      it 'redirects to the created item' do
        post :create, params: { item: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Item.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { item: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested item' do
        item = Item.create! valid_attributes
        put :update, params: { id: item.to_param, item: new_attributes }, session: valid_session
        item.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the item' do
        item = Item.create! valid_attributes
        put :update, params: { id: item.to_param, item: valid_attributes }, session: valid_session
        expect(response).to redirect_to(item)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        item = Item.create! valid_attributes
        put :update, params: { id: item.to_param, item: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested item' do
      item = Item.create! valid_attributes
      expect do
        delete :destroy, params: { id: item.to_param }, session: valid_session
      end.to change(Item, :count).by(-1)
    end

    it 'redirects to the items list' do
      item = Item.create! valid_attributes
      delete :destroy, params: { id: item.to_param }, session: valid_session
      expect(response).to redirect_to(items_url)
    end
  end
end
