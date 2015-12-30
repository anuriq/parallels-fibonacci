
def fibonacci_number(n):
    n = int(n)
    if n == 1 or n == 2:
        return 1
    else:
        result = fibonacci_number(n - 1) + fibonacci_number(n - 2)
        return result
