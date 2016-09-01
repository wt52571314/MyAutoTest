# __author__ = 'Administrator'
# import requests
# payload = json.dumps({
#   "surveyResult":
#     {
#       "questionId": 49,
#       "optionId": 286
#     },
#     {
#       "questionId": 50,
#       "optionId": 290
#     },
#     {
#       "questionId": 51,
#       "optionId": 295
#     },
#     {
#       "questionId": 52,
#       "optionId": 297
#     },
#     {
#       "questionId": 53,
#       "optionId": 299
#     },
#     {
#       "questionId": 54,
#       "optionId": 301
#     },
#     {
#       "questionId": 55,
#       "optionId": 303
#     },
#     {
#       "questionId": 56,
#       "optionId": 305
#     },
#     {
#       "questionId": 57,
#       "optionId": 310
#     },
#     {
#       "questionId": 58, "optionId": 315, "roboAccountId": "robotAccountId123"})
# style = requests.post('https://api.bbaecdn.com/api/v1/us/roboAdvisor/postSurveyResult', data=payload)
# print style.content
a = '[{"questionId": 49,"optionId": 286},{"questionId": 50,"optionId": 290},{"questionId": 51,"optionId": 295},{"questionId": 52,"optionId": 297},{"questionId": 53,"optionId": 299},{"questionId": 54,"optionId": 301},{"questionId": 55,"optionId": 303},     {        "questionId": 56,       "optionId": 305     },     {        "questionId": 57,       "optionId": 310     },     {        "questionId": 58,       "optionId": 315     }   ]'
print a.replace(' ', '')
