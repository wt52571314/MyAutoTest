# coding=utf-8
# ===============================================================================
# @ Creator:zhn
# @ Date:2016-10-18
# user类
# ===============================================================================


class User:
    new_positions_id = 1
    old_positions_id = 0

    def __init__(self):

        self.old_positions = []
        self.new_positions = []

    def set_old(self, positions_id, positions):
        self.old_positions_id = positions_id
        self.old_positions = positions

    def set_new(self, positions_id, positions):
        self.new_positions_id = positions_id
        self.new_positions = positions

    def get_old(self):
        return self.old_positions_id, self.old_positions

    def get_new(self):
        return self.new_positions