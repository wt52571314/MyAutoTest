from Tkinter import *
root = Tk()
labelfont = ('time', 24, 'italic')
widget = Label(root, text='Eat At JOES')
widget.config(bg='black', fg='red')
widget.pack(expand=YES, fill=BOTH)
root.mainloop()
