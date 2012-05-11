pdf.move_down 70

# Add the font style and size
pdf.font "Helvetica"
pdf.font_size 18

pdf.font_size 22
pdf.text "Here is the details of your product in pdf format", :align => :center
pdf.move_down 20

pdf.font_size 14
pdf.text "Listing Products", :align=> :center

items = [["Item Name", "Item Price","Item Description"]]

items += @products.map do |item|
  [
        item.name,
        item.price,
        item.description
  ]
end


pdf.table items


