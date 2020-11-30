import pandas as pd

def cronbachs_alpha(items):
    items = pd.DataFrame(items)
    items_count = items.shape[1]
    variance_sum = float(items.var(axis=0, ddof=1).sum())
    total_var = float(items.sum(axis=1).var(ddof=1))

    return (items_count / float(items_count - 1) *
            (1 - variance_sum / total_var))

data = pd.read_csv("Rating-polyps-questionnaire.csv")
relevant_data = data.iloc[:,[3,5,6,7,8,9,10,12,13,14,15,16,17,
    19,20,21,22,23,24,26,27,28,29,30,31,33,34,35,36,37,38,
    40,41,42,43,44,45,47,48,49,50,51,52,54,55,56,57,58,59,
    61,62,63,64,65,66,68,69,70,71,72]]
print(relevant_data)

q1 = relevant_data.iloc[:,0:6]
print(cronbachs_alpha(q1))
