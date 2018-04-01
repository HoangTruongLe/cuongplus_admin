class Super::UsersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_user, only: [:show, :edit, :update, :destroy, :update_profile, :update_income]
  before_action :set_user_profile, only: [:edit, :update, :update_profile, :update_income]
  before_action :set_income, only: [:edit, :update, :update_income, :update_profile]
  authorize_resource

  def index
    @q = User.ransack(params[:q])
    users = @q.result().filter_and_sort(params)
    @users = users.page(params[:page]).per(20)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to super_users_path, notice: 'Success'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to super_users_path, notice: 'Success'
    else
      render :edit, notice: 'Error'
    end
  end

  def update_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to super_users_path, notice: 'Success'
    else
      @profile_updating = true
      render 'super/users/edit', notice: 'Error'
    end
  end

  def update_income
    @income.assign_attributes(income_params)
    if @income.save
      redirect_to super_users_path, notice: 'Success'
    else
      @income_updating = true
      render 'super/users/edit', notice: 'Error'
    end
  end

  def destroy
    @user.destroy unless @user.super_user?
    redirect_to super_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_user_profile
    @profile = @user.profile || Profile.new(user: @user)
  end

  def set_income
    if @user.income
      @income = @user.income
      new_question_template(@user.income) unless @user.income.extra_questions.any?
    else
      @income = Income.new(user: @user)
      if @income.save(validate: false)
        new_question_template(@income)
      end
    end
  end

  def new_question_template(income)
    QuestionTemplate.all.each do |question_template|
      income.extra_questions.new(question_type: question_template.question_type)
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def profile_params
    params.require(:profile).permit(
      :id, :user_id, :title, :attn_if_any, :dob, :gender,
      :first_name, :last_name, :email, :tax_file_number, :confirm_email,
      :phone, :residental_address, :residental_suburb, :residental_state,
      :residental_postcode, :residental_country, :postal, :postal_address,
      :postal_suburb, :postal_state, :postal_postcode, :postal_country,
      :preferred_contact_method, :id_type, :number, :source
    )
  end

  def income_params
    params.require(:income).permit(:salary_or_wage, :bank_interest,
      :centre_link_payment, :etp, :superannuation, :share_dividends, :sell_any_shares, :managed_fund,
      :trust_or_partnership_distributions, :foreign_sourced, :other_income, :unsure, :number_employer,
      :upload_files_attributes => [:id, :file, :_destroy],
      :extra_questions_attributes => [:id, :question_type, :other,
        :fringe_benefit_amount, :gross_income, :employer_name, :allowance, :occupation, :employer_abn,
        :tax_withheld, :number_employers, :bank_name, :interest_amount, :payment_name,
        :taxable_component, :tax_free_component, :fund_name, :taxed_element,
        :untaxed_element, :share_name, :franked_amount, :unfranked_amount, :franking_credit,
        :cost, :sale_price, :date_of_acquisition, :date_of_sale, :list_details, :done, :_destroy]
    )
  end
end
