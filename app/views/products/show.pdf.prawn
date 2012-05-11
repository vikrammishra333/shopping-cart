pdf.move_down 70

# Add the font style and size
pdf.font "Helvetica"
pdf.font_size 18
pdf.text_box "Invoice # #{@product.id}", :align => :right

pdf.font_size 22
pdf.text "Here is the details of your product in pdf format", :align => :center
pdf.move_down 20

pdf.font_size 14
pdf.text "Below you can find your order details. We hope you shop with Awesome Company again in the future. Now unleash those fonts like hell have no fury!", :align=> :center

invoiceinfo = [["Item Name", "#{@product.name}"], ["Item Price", "#{@product.price}"],["Item Description", "#{@product.description}"]]

pdf.move_down 30

pdf.table invoiceinfo
