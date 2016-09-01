__author__ = 'Administrator'
def debug(fmt, *args):
    print(fmt % args)
if __name__ == '__main__':
    debug('[LOG] <%s> %s (uuid=%s)', ['note', 'info', 'warning', 'hole'][0], ':', str(None))