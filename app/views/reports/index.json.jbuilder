json.array!(@reports) do |report|
  json.extract! report, :id, :date_report, :status, :descriptor, :payment, :delivery, :settled, :commission, :account_dest
  json.url report_url(report, format: :json)
end
