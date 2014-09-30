require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

module Stachio
  describe TemplatesController do
    routes { Stachio::Engine.routes }

    # 'render_views' will render any erb /haml/whatever as part of the tests, thus
    # providing some (minimal) assurance that nothing stupid was done
    render_views

    # This should return the minimal set of attributes required to create a valid
    # Template. As you add validations to Template, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) do
      { "template_name" => "MyString",
        "content" => "I am a {{teapot}}",
      }
    end

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # TemplatesController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "GET index" do
      it "assigns all templates as @templates" do
        template = Template.create! valid_attributes
        get :index, {}, valid_session
        assigns(:templates).should eq([template])
      end

      it "does not require permission" do
        Stachio::Engine.config.stub(:readonly).and_return(true)
        template = Template.create! valid_attributes
        get :index, {}, valid_session
        response.should_not redirect_to(templates_path)
      end
    end

    describe "GET show" do
      it "assigns the requested template as @template" do
        template = Template.create! valid_attributes
        get :show, {:id => template.to_param}, valid_session
        assigns(:template).should eq(template)
      end

      it "does not require permission" do
        Stachio::Engine.config.stub(:readonly).and_return(true)
        template = Template.create! valid_attributes
        get :show, {:id => template.to_param}, valid_session
        response.should_not redirect_to(templates_path)
      end
    end

    describe "GET new" do
      it "requires permission" do
        Stachio::Engine.config.stub(:readonly).and_return(true)
        get :new, {}, valid_session
        response.should redirect_to(templates_path)
      end

      it "assigns a new template as @template" do
        get :new, {}, valid_session
        assigns(:template).should be_a_new(Template)
      end
    end

    describe "GET edit" do
      it "requires permission" do
        Stachio::Engine.config.stub(:readonly).and_return(true)
        template = Template.create! valid_attributes
        get :edit, {:id => template.to_param}, valid_session
        response.should redirect_to(templates_path)
      end

      it "assigns the requested template as @template" do
        template = Template.create! valid_attributes
        get :edit, {:id => template.to_param}, valid_session
        assigns(:template).should eq(template)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "requires permission" do
          Stachio::Engine.config.stub(:readonly).and_return(true)
          expect {
            post :create, {:template => valid_attributes}, valid_session
          }.to_not change(Template, :count).by(1)
          response.should redirect_to(templates_path)
        end

        it "creates a new Template" do
          expect {
            post :create, {:template => valid_attributes}, valid_session
          }.to change(Template, :count).by(1)
        end

        it "assigns a newly created template as @template" do
          post :create, {:template => valid_attributes}, valid_session
          assigns(:template).should be_a(Template)
          assigns(:template).should be_persisted
        end

        it "redirects to the created template" do
          post :create, {:template => valid_attributes}, valid_session
          response.should redirect_to(Template.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved template as @template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Template.any_instance.stub(:save).and_return(false)
          post :create, {:template => { "template_name" => "invalid value" }}, valid_session
          assigns(:template).should be_a_new(Template)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Template.any_instance.stub(:save).and_return(false)
          post :create, {:template => { "template_name" => "invalid value" }}, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "requires permission" do
          template = Template.create! valid_attributes
          Stachio::Engine.config.stub(:readonly).and_return(true)
          Template.any_instance.should_not_receive(:update_attributes).with({ "template_name" => "MyString" })
          put :update, {:id => template.to_param, :template => { "template_name" => "MyString" }}, valid_session
          response.should redirect_to(templates_path)
        end

        it "updates the requested template" do
          template = Template.create! valid_attributes
          # Assuming there are no other templates in the database, this
          # specifies that the Template created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Template.any_instance.should_receive(:update_attributes).with({ "template_name" => "MyString" })
          put :update, {:id => template.to_param, :template => { "template_name" => "MyString" }}, valid_session
        end

        it "assigns the requested template as @template" do
          template = Template.create! valid_attributes
          put :update, {:id => template.to_param, :template => valid_attributes}, valid_session
          assigns(:template).should eq(template)
        end

        it "redirects to the template" do
          template = Template.create! valid_attributes
          put :update, {:id => template.to_param, :template => valid_attributes}, valid_session
          response.should redirect_to(template)
        end
      end

      describe "with invalid params" do
        it "assigns the template as @template" do
          template = Template.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Template.any_instance.stub(:save).and_return(false)
          put :update, {:id => template.to_param, :template => { "template_name" => "invalid value" }}, valid_session
          assigns(:template).should eq(template)
        end

        it "re-renders the 'edit' template" do
          template = Template.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Template.any_instance.stub(:save).and_return(false)
          put :update, {:id => template.to_param, :template => { "template_name" => "invalid value" }}, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "requires permission" do
        template = Template.create! valid_attributes
        Stachio::Engine.config.stub(:readonly).and_return(true)

        expect {
          delete :destroy, {:id => template.to_param}, valid_session
        }.to_not change(Template, :count).by(-1)

        response.should redirect_to(templates_path)
      end

      it "destroys the requested template" do
        template = Template.create! valid_attributes
        expect {
          delete :destroy, {:id => template.to_param}, valid_session
        }.to change(Template, :count).by(-1)
      end

      it "redirects to the templates list" do
        template = Template.create! valid_attributes
        delete :destroy, {:id => template.to_param}, valid_session
        #response.should redirect_to(templates_url)       ## Requires default_host_url to be set, but we're in an engine.
        response.should redirect_to(templates_path)       ## So, instead, we test the redirection against the relative path
      end
    end

  end
end
