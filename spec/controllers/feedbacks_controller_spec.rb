require 'rails_helper'

RSpec.describe FeedbacksController, type: :controller do
	before(:each) do
		@feedback = FactoryBot.create(:feedback)
		@user = FactoryBot.create(:regular_user)
		@admin = FactoryBot.create(:admin)
	end

	describe "GET index" do
	    it "assigns @feedbacks" do
	      get :index
	      expect(assigns(:feedbacks)).to eq([@feedback])
	    end

	    it "renders the index template" do
	      get :index
	      expect(response).to render_template("index")
	    end
  	end

  	describe "GET new" do
  		it "assigns a new feedback to @feedback as a user or visitor" do
  			get :new
  			expect(assigns(:feedback)).to be_a_new(Feedback)
  			sign_in(@user)
  			get :new
  			expect(assigns(:feedback)).to be_a_new(Feedback)
  		end

  		it "redirects admin to index" do
  			sign_in(@admin)
  			get :new
  			expect(response).to redirect_to(feedbacks_url(assigns(:feedbacks)))
  		end
  	end

  	describe "POST create" do
  		it "creates a new feedback as a user or visitor" do
  			expect{ 
  				post :create, params: {feedback: FactoryBot.attributes_for(:new_feedback)}
  				}.to change(Feedback, :count).by(1)
  			sign_in(@user)
  			expect{ 
  				post :create, params: {feedback: FactoryBot.attributes_for(:new_feedback)}
  				}.to change(Feedback, :count).by(1)
  		end

  		it "redirects admin to index" do
  			sign_in(@admin)
  			post :create, params: {feedback: FactoryBot.attributes_for(:new_feedback)}
  			expect(response).to redirect_to(feedbacks_url(assigns(:feedbacks)))
  		end
  	end

  	describe "GET show" do
  		it "shows assigned @feedback to admin" do
  			sign_in(@admin)
  			get :show, params: { id: @feedback.id }
  		end

  		it "redirects user and visitor to index" do
  			get :show, params: { id: @feedback.id}
  			expect(response).to redirect_to(feedbacks_url(assigns(:feedbacks)))
  			sign_in(@user)
  			get :show, params: { id: @feedback.id}
  			expect(response).to redirect_to(feedbacks_url(assigns(:feedbacks)))
  		end
  	end

  	describe "GET edit" do
  		it "redirects all people to index" do
	  		get :edit, params: { id: @feedback.id }
	  		expect(response).to redirect_to(feedbacks_url(assigns(:feedbacks)))
	  		sign_in(@user)
	  		get :edit, params: { id: @feedback.id }
	  		expect(response).to redirect_to(feedbacks_url(assigns(:feedbacks)))
	  		sign_out(@user)
	  		sign_in(@admin)
	  		get :edit, params: { id: @feedback.id }
	  		expect(response).to redirect_to(feedbacks_url(assigns(:feedbacks)))
  		end
  	end

  	describe "PATCH update" do
  		it "redirects all people to index" do
	  		patch :update, params: { id: @feedback.id }
	  		expect(response).to redirect_to(feedbacks_url(assigns(:feedbacks)))
	  		sign_in(@user)
	  		patch :update, params: { id: @feedback.id }
	  		expect(response).to redirect_to(feedbacks_url(assigns(:feedbacks)))
	  		sign_out(@user)
	  		sign_in(@admin)
	  		patch :update, params: { id: @feedback.id }
	  		expect(response).to redirect_to(feedbacks_url(assigns(:feedbacks)))
  		end
  	end

  	describe "DELETE destroy" do
  		it "redirects all people to index" do
	  		delete :destroy, params: { id: @feedback.id }
	  		expect(response).to redirect_to(feedbacks_url(assigns(:feedbacks)))
	  		sign_in(@user)
	  		delete :destroy, params: { id: @feedback.id }
	  		expect(response).to redirect_to(feedbacks_url(assigns(:feedbacks)))
	  		sign_out(@user)
	  		sign_in(@admin)
	  		delete :destroy, params: { id: @feedback.id }
	  		expect(response).to redirect_to(feedbacks_url(assigns(:feedbacks)))
  		end
  	end
end
