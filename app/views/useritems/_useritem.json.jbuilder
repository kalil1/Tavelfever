json.extract! useritem, :id, :name, :checklist_id, :user_id, :created_at, :updated_at
json.url useritem_url(useritem, format: :json)
