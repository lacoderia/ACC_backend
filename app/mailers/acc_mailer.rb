class ACCMailer < ActionMailer::Base
  default from: "soporteapps@acc.com.co"

  def lead_mail(lead)
  	@lead = lead
  	mail(to: "afiliaciones@acc.com.co", subject: 'Nueva solicitud de afiliación')
  end

  def insurance_lead_mail(insurance_lead)
  	@insurance_lead = insurance_lead
  	mail(to: "seguros@acc.com.co", subject: 'Nueva solicitud de seguros')
  end

  def process_lead_mail(process_lead)
  	@process_lead = process_lead
  	mail(to: "tramites@acc.com.co", subject: 'Nueva solicitud de trámite')
  end

  #def roadside_assitance_mail(roadside_assitance)
  #	@roadside_assitance = roadside_assitance
  #	mail(to: "sistemas@acc.com.co", subject: 'Nueva solicitud de grúa o desvare')
  #end
end