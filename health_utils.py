def calculate_bmi(height, weight):
    """Calculate Body Mass Index (BMI) given height in meters and weight in kilograms."""
    if height == 0:
        raise ValueError("Height cannot be zero.")
    return weight / (height ** 2)

def calculate_bmr(height, weight, age, gender):
    """Calculer le taux métabolique de base (TMB) selon l'équation de Harris-Benedict."""
    if gender.lower() == 'male':
        return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
    elif gender.lower() == 'female':
        return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age)
    else:
        raise ValueError("Gender must be 'male' or 'female'.")
