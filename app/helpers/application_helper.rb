module ApplicationHelper
  # Metodo para saber si el usuario actual es un administrador
  def is_current_admin?
    if current_user.is_admin == true && current_user.is_admin =! nil
      return true
    else
      return false
    end
  end
end
