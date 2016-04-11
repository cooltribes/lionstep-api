require "csv"
class UsersCsvExporter

  def initialize(filename = "users.csv")
    @filename = filename
  end

  def header
    ["id", "Nombre", "Apellido", "Fecha Nacimiento", "Pais", "Ciudad", "Licencia","-",
     "Titulo", "Area", "Fecha Inicio", "Fecha Graduacion", "Nombre Institucion",
     "Habilidades", "Nota Minima", "Nota Maxima", "Nota Personal","-", "Posicion",
     "Organizacion", "Fecha de Inicio", "Fecha de Salida", "Sector", "Habilidades",
     "Pais", "Ciudad", "Current", "-", "Habilidades", "-", "Idiomas", "-",
     "Actividades Extracurriculares", "-", "Resultado de Test"]
  end

  def first_academic_experience(user)
    xp = user.academic_experiences.to_a.first
    academic_experience(xp)
  end

  def academic_experience(xp)
    if xp
      [xp.academic_degree.try(:name), xp.academic_area.try(:name), xp.start_date, xp.end_date,
       xp.institution, xp.skills.map(&:name).join(", "), xp.minimum_grade, xp.maximum_grade,
       xp.actual_grade ]
    else
      9.times.map { "" }
    end
  end

  def first_professional_experience(user)
    xp = user.professional_experiences.to_a.first
    professional_experience(xp)
  end

  def professional_experience(xp)
    if xp
      [xp.position, xp.organization, xp.start_date, xp.end_date, xp.sector.try(:name),
       xp.skills.map(&:name).join(", "), xp.country.try(:name), xp.city, xp.current]
    else
      9.times.map { "" }
    end
  end

  def rest_experiences(user)
    axp = user.academic_experiences.to_a
    pxp = user.professional_experiences.to_a
    max = [pxp.count, axp.count].max
    max.times.map do |x|
      index = x + 1
      7.times.map {" "} + academic_experience(axp[index]) + [""] + professional_experience(pxp[index])
    end
  end

  def profile_info(user)
    profile = user.profile
    [user.id, profile.first_name, profile.last_name, profile.born_date, profile.country.try(:name),
     profile.city, profile.driver_license]
  end

  def languages(user)
    [user.languages.map(&:name).join(", ")]
  end

  def skills(user)
    [user.skills.map(&:name).join(", ")]
  end

  def extra_activities(user)
    [user.extra_activities.map(&:name).join(", ")]
  end

  def test_result(user)
    if user.get_test_results
      [user.get_test_results[:name]]
    else
      [""]
    end
  end

  def convert!
    CSV.open(file_path, "wb") do |csv|
      csv << header
      User.all.each do |user|
        csv << profile_info(user) + [""] +
        first_academic_experience(user) + [""] +
        first_professional_experience(user) + [""] +
        skills(user) +[""] +
        languages(user) + [""] +
        extra_activities(user) + [""] +
        test_result(user)
        rest_experiences(user).each do |xp|
          csv << [""] + xp
        end
      end
    end
  end

  def file_path
    "#{Rails.root}/public/csv/#{@filename}"
  end

end