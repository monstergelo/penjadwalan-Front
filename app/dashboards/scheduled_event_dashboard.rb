require "administrate/base_dashboard"

class ScheduledEventDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    mahasiswa: Field::BelongsTo,
    pembimbing: Field::BelongsTo,
    penguji: Field::BelongsTo,
    room: Field::BelongsTo,
    id: Field::Number,
    end: Field::DateTime,
    start: Field::DateTime,
    student_id: Field::String,
    event_type: Field::Number,
    event_name: Field::String,
    kategori: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :mahasiswa,
    :pembimbing,
    :penguji,
    :room,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :mahasiswa,
    :pembimbing,
    :penguji,
    :room,
    :id,
    :end,
    :start,
    :student_id,
    :event_type,
    :event_name,
    :kategori,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :mahasiswa,
    :pembimbing,
    :penguji,
    :room,
    :end,
    :start,
    :student_id,
    :event_type,
    :event_name,
    :kategori,
  ].freeze

  # Overwrite this method to customize how scheduled events are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(scheduled_event)
  #   "ScheduledEvent ##{scheduled_event.id}"
  # end
end
