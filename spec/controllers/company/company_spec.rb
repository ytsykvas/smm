require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:company) { FactoryBot.create(:company) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    before do
      FactoryBot.create(:company)
    end

    context 'show all companies' do
      it 'returns success' do
        get :index
        expect(assigns(:companies)).to be_present
      end
    end

    context 'show index template' do
      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'GET #new' do
    it 'assigns a new company' do
      get :new
      expect(assigns(:company)).to be_a_new(Company)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested company' do
      get :edit, params: { id: company.id }
      expect(assigns(:company)).to eq(company)
    end

    it 'renders the edit template' do
      get :edit, params: { id: company.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      it 'updates the company' do
        new_name = 'New Company Name'
        patch :update, params: { id: company.id, company: { name: new_name } }
        company.reload
        expect(company.name).to eq(new_name)
      end

      it 'redirects to companies_path with a notice' do
        patch :update, params: { id: company.id, company: { name: 'New Name' } }
        expect(response).to redirect_to(companies_path)
        expect(flash[:notice]).to eq(I18n.t('company.updated_successfully'))
      end
    end

    context 'with invalid params' do
      it 'renders the edit template' do
        patch :update, params: { id: company.id, company: { name: '' } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:social) { FactoryBot.create(:social) }

      it 'creates a new company' do
        expect do
          post :create, params: { company: { name: 'Mountain Dew',
                                             social_id: social.id,
                                             information: 'Some info',
                                             started_at: Time.now.to_date } }
        end.to change(Company, :count).by(1)
      end

      it 'redirects to companies_path with a notice' do
        post :create, params: { company: { name: 'Mountain Dew',
                                           social_id: social.id,
                                           information: 'Some info',
                                           started_at: Time.now.to_date } }
        expect(response).to redirect_to(companies_path)
        expect(flash[:notice]).to eq(I18n.t('company.created_successfully'))
      end
    end

    context 'with invalid params' do
      it 'renders the new template' do
        post :create, params: { company: { name: '' } }
        expect(response).to render_template(:new)
      end
    end
  end
end
