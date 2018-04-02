module ApplicationHelper
  def labeled_data_paragraph label, data, options={}
    if options[:class].present?
      options[:class] += " labeled_data_paragraph"
    else
      options[:class] = "labeled_data_paragraph"
    end
  end

  def format_datetime_dmy(datetime)
    datetime.try(:strftime, '%d/%m/%Y')
  end

  def format_currency(text)
    number_to_currency text, unit: "đ", separator: ",", delimiter: ".", format: "%n %u", precision: 0
  end
end
