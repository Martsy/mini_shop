# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MerchantsController, type: :controller do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Merchant.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      merchant = Merchant.create! valid_attributes
      get :show, params: { id: merchant.to_param }, session: valid_session
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
      merchant = Merchant.create! valid_attributes
      get :edit, params: { id: merchant.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Merchant' do
        expect do
          post :create, params: { merchant: valid_attributes }, session: valid_session
        end.to change(Merchant, :count).by(1)
      end

      it 'redirects to the created merchant' do
        post :create, params: { merchant: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Merchant.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { merchant: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested merchant' do
        merchant = Merchant.create! valid_attributes
        put :update, params: { id: merchant.to_param, merchant: new_attributes }, session: valid_session
        merchant.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the merchant' do
        merchant = Merchant.create! valid_attributes
        put :update, params: { id: merchant.to_param, merchant: valid_attributes }, session: valid_session
        expect(response).to redirect_to(merchant)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        merchant = Merchant.create! valid_attributes
        put :update, params: { id: merchant.to_param, merchant: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested merchant' do
      merchant = Merchant.create! valid_attributes
      expect do
        delete :destroy, params: { id: merchant.to_param }, session: valid_session
      end.to change(Merchant, :count).by(-1)
    end

    it 'redirects to the merchants list' do
      merchant = Merchant.create! valid_attributes
      delete :destroy, params: { id: merchant.to_param }, session: valid_session
      expect(response).to redirect_to(merchants_url)
    end
  end
end
