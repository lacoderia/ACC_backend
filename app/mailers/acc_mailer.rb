class ACCMailer < ActionMailer::Base
  default from: "soporteapps@acc.com.co"

  def lead_email(lead)
  	@lead = lead
  	mail(to: "afiliaciones@acc.com.co", subject: 'Nueva solicitud de afiliación a ACC')
  end

  def insurance_lead_email(insurance_lead)
  	@insurance__lead = lead
  	mail(to: "seguros@acc.com.co", subject: 'Nueva solicitud de contratación de seguros')
  end

  def process_lead_email(process_lead)
  	@process_lead = lead
  	mail(to: "tramites@acc.com.co", subject: 'Nueva solicitud de trámite')
  end

  def roadside_assitance_mail(roadside_assitance)
  	@roadside_assitance = roadside_assitance
  	mail(to: "tramites@acc.com.co", subject: 'Nueva solicitud de grúa o desvare')
end