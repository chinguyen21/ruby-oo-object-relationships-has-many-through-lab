class Patient
  attr_reader :name
  
  @@all = []
  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def appointments
    Appointment.all.select {|appointment| appointment.patient == self}
  end

  def doctors
    doctors = []
    Appointment.all.each do |appointment| 
      doctors << appointment.doctor if appointment.patient == self
    end
    doctors
  end

  def new_appointment(date, doctor)
    Appointment.new(date, self, doctor)
  end


end
