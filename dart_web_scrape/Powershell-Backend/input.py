import pglet
from pglet import Textbox, Button, Text
with pglet.page("Url Collection") as page:
    def button_clicked(e):
        t.value = f"Textboxes values are: '{tb1.value}'"
        page.update()

    t = Text()
    tb1 = Textbox(label="Url:")    
    b = Button(text='Submit', on_click=button_clicked)
    page.add(tb1)

    input()