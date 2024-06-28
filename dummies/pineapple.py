class Pineapple:
    def __init__(self, weight):
        self.weight = weight

    def is_ripe(self):
        return self.weight > 2

pineapple = Pineapple(3)
if pineapple.is_ripe():
    print("The pineapple is ripe.")
else:
    print("The pineapple is not ripe.")
