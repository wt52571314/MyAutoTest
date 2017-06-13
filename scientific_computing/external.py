# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2017-03-31
# python编程练习---适配器模式外部类
# ===============================================================================


class Synthesizer:

    def __init__(self, name):
        self.name = name

    def __str__(self):
        return 'the {} synthesizer'.format(self.name)

    def play(self):
        return 'is playing an electronic song'


class Human:

    def __init__(self, name):
        self.name = name

    def __str__(self):
        return '{} the human'.format(self.name)

    def speak(self):
        return 'says hello'
