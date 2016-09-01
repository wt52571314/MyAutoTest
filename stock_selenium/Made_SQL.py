# -*- coding: utf-8 -*-
# ===============================================================================
# @ Creator:张海南
# @ Date:2016-5-13
# @ 描述：SQL生成器
# ===============================================================================


def str_made(string):
    string_use = ''
    list_use = string.split('||')
    # print list_use
    for i in list_use:
        question = i[2:4]
        # print question
        question_option = i[10:-1]
        string_use += ('or question.id = '+question+' and question_option.id = '+question_option+'\n')
    return string_use

if __name__ == '__main__':
    print str_made('($38$ === 252)||($28$ === 122)||($29$ === 127)||($29$ === 128)||($30$ === 129)||($30$ === 130)||($31$ === 133)||($31$ === 135)||($31$ === 136)||($31$ === 137)||($32$ === 142)||($32$ === 143)||($32$ === 144)||($32$ === 145)||($33$ === 148)||($33$ === 149)||($33$ === 150)||($33$ === 151)')