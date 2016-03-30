class TestProcessador

  attr_reader :values

  DIMENSIONS_LETTER = {
    "extraversion" => "E",
    "feeling" => "F",
    "introversion" => "I",
    "judging" => "J",
    "intuition" => "N",
    "perceiving" => "P",
    "sensing" => "S",
    "thinking" => "T"
  }

  DIMENSIONS_IMAGE_NAME = {
    "extraversion" => "E",
    "feeling" => "F",
    "introversion" => "I",
    "judging" => "J",
    "intuition" => "N",
    "perceiving" => "P",
    "sensing" => "S",
    "thinking" => "T"
  }


  TYPES = { "INTJ" => "structured", "INTP" => "logical", "ENTJ" => "commander",
    "ENTP" => "rhetorical", "INFJ" => "respectful", "INFP" => "mediador",
    "ENFJ" => "protagonist", "ENFP" => "tenacious", "ISTJ" => "logical",
    "ISFJ" => "defender", "ESTJ" => "executive", "ESFJ" => "diplomatic",
    "ISTP" => "virtuous", "ISFP" => "aventurous", "ESTP" => "entrepreneur",
    "ESFP" => "animator"}

  OPPOSITES = {
    "introversion" => "extraversion",
    "sensing" => "intuition",
    "thinking" => "feeling",
    "perceiving" => "judging"
  }

  def self.questions
    DIMENSIONS_LETTER.keys.each_with_object({}) do |dim, questions|
      questions[dim] = I18n.t("test.question.#{dim}")
    end
  end

  def self.type_information
    TYPES.keys.each_with_object({}) do |type, information|
      information[type] = {
        name: I18n.t("test.types.#{type}.name"),
        description: I18n.t("test.types.#{type}.description"),
        top: I18n.t("test.types.#{type}.top"),
        flop: I18n.t("test.types.#{type}.flop"),
        adjetives: I18n.t("test.types.#{type}.adjetives"),
        image_name: TYPES[type]
      }
    end
  end

  def initialize(values)
    @values = values
    @type = ""
    process_opposites!
  end

  def type
    @type.upcase
  end

  def results
    TestProcessador.type_information[type]
  end

  def name
    TestProcessador.type_information[type][:name]
  end

  def description
    TestProcessador.type_information[type][:description]
  end

  def top
    TestProcessador.type_information[type][:top]
  end

  def flop
    TestProcessador.type_information[type][:flop]
  end

  def image_name
    TestProcessador.type_information[type][:image_name]
  end

  private

  def process_opposites!
    OPPOSITES.each do |dim1, dim2|
      dim1_value = values.send(dim1)
      dim2_value = values.send(dim2)

      win_dim = if dim1_value == dim2_value
        choose_one(dim1, dim2)
      elsif dim1_value > dim2_value
        dim1
      else
        dim2
      end

      @type << DIMENSIONS_LETTER[win_dim]
    end
  end

  def choose_one(dim1, dim2)
    [dim1, dim2].sample
  end
end