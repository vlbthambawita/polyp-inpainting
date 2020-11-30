import pandas as pd


def cronbachs_alpha(items):
    items = pd.DataFrame(items)
    items_count = items.shape[1]
    variance_sum = float(items.var(axis=0, ddof=1).sum())
    total_var = float(items.sum(axis=1).var(ddof=1))

    return (items_count / float(items_count - 1) *
            (1 - variance_sum / total_var))


q1 = [
[ 3,8,3, 3, 7, 8],
[ 2,8,4, 2, 3, 8],
[ 6,4,7, 4, 3, 3],
[ 4,3,3, 4, 4, 4],
[ 3,8,3, 2, 8, 9],
[ 6,6,1, 6, 7,10],
[10,5,7,10, 4, 8]]

print(cronbachs_alpha(q1))
