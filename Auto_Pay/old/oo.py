# __author__ = 'Administrator'
# [
# {"questionId":"5","questionAns":"4"},
# {"questionId":"6","questionAns":"8"},
# {"questionId":"7","questionAns":"12"},
# {"questionId":"9","questionAns":"15"},
# {"questionId":"10","questionAns":"18"},
# {"questionId":"11","questionAns":"24"},

# {"questionId":"12","questionAns":"27"},
# {"questionId":"13","questionAns":"28"},
# {"questionId":"14","questionAns":"30"},
# {"questionId":"15","questionAns":"33"},
# {"questionId":"16","questionAns":"36"},
# {"questionId":"17","questionAns":"39"},
# {"questionId":"18","questionAns":"42"},
# {"questionId":"19","questionAns":"48"}
# ]
import urllib2
List_json = []
dir_json = {}
List_Id = ['5', '6', '7', '9', '10', '11', '12', '13', '14', '15', '16', '20', '17', '18', '19']
fp_input = open('D:\log\input_use.txt', 'r')
fp_result = open('D:\log\output.txt', 'a')

for line in fp_input:
    List = line[1:-2].split(",")
    for i in range(0, len(List)):
        dir_json["questionId"] = List_Id[i]
        dir_json["questionAns"] = List[i]
        List_json.append(dir_json)
        dir_json = {}
    a = str(List_json).replace('\'', '\"')
    a = a.replace(' ', '')
    List_json = []
    url_save = 'http://*******/portfolio/user/saveQuestionAns?uid=1118155&birthday=1985-07-08&answers='+a
    url_result = 'http://********/portfolio/user/getUserBasicInfo?uid=1118155'
    try:
            s_save = urllib2.urlopen(url_save).read()
            s_result = urllib2.urlopen(url_result).read()
            fp_result.writelines(s_result)
            fp_result.writelines('\n')
    except urllib2.HTTPError, e:
        print e.code
    except urllib2.URLError, e:
        print str(e)
fp_input.close()
fp_result.close()
