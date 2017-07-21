require "administrate/base_dashboard"

class MahasiswaDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    pengujis: Field::HasMany,
    pembimbings: Field::HasMany,
    scheduled_event: Field::HasOne,
    user: Field::HasOne,
    id: Field::Number,
    provider: Field::String,
    uid: Field::String,
    email: Field::String,
    name: Field::String,
    oauth_token: Field::String,
    oauth_refresh_token: Field::String,
    role: Field::String,
    NIP: Field::String,
    NIM: Field::String,
    oauth_expires_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String,
    last_sign_in_ip: Field::String,
    is_admin: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :pengujis,
    :pembimbings,
    :scheduled_event,
    :user,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :pengujis,
    :pembimbings,
    :scheduled_event,
    :user,
    :id,
    :provider,
    :uid,
    :email,
    :name,
    :oauth_token,
    :oauth_refresh_token,
    :role,
    :NIP,
    :NIM,
    :oauth_expires_at,
    :created_at,
    :updated_at,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :is_admin,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :pengujis,
    :pembimbings,
    :scheduled_event,
    :user,
    :provider,
    :uid,
    :email,
    :name,
    :oauth_token,
    :oauth_refresh_token,
    :role,
    :NIP,
    :NIM,
    :oauth_expires_at,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :is_admin,
  ].freeze

  # Overwrite this method to customize how mahasiswas are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(mahasiswa)
  #   "Mahasiswa ##{mahasiswa.id}"
  # end
end