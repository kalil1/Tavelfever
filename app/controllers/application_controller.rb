class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_variables

def set_variables
  @document = [" Passport/visa(s) – Not sure if you need a travel visa? Check here.",
     " Personal ID/Student ID card – If you’re a student, some companies, ",
     " Frequent flyer card(s) and other loyalty program card numbers ",
     " Cash and credit card(s) – Call your credit card companies before you travel to inform
     them of your travel (otherwise they might turn them off to prevent perceived fraud) ",
     " Health insurance cards/document(s)",
     " Travel insurance information",
     " Reservations and itineraries – print them and save them electronically for easy access ",
     " Hotel and/or tour contact information ",
     " Transportation tickets (plane, train, bus, car, etc.) ",
     " Emergency contacts and important addresses ",
     " Copies of all these things in case you lose your wallet ",
     " Guide  s and maps"]

     @basics = [" Lightweight clothing that can be layered",
       " Long-sleeved shirts",
       " Sweaters or fleece jacket",
       " Pants and/or shorts",
       " Socks – wool socks are best for hiking",
       " Comfortable walking shoes",
       " Rain jacket, windbreaker or umbrella",
       " Pajamas/sleepwear",
       " Underwear",
       " Sunglasses and glasses case",
       " Dresses and/or skirts",
       " Jewelry – organize in a mini cube or circlet",
       " Hat or sun visor",
       " Scarf or bandana",
       " Swimsuit or swim trunks – consider a wet/dry organizer",
       " Cell phone and charger",
       " Travel speakers",
       " Travel pillow, eye mask and ear plugs",
       " Electric converters and adapters",
       " Travel apps that will help with language, directions, and money conversion",]


       @toiletry = [" Toothbrush, toothpaste, floss, mouthwash",
 " Hair brush or comb, hair ties, barrettes/bobby pins",
 " Deodorant",
 " Shampoo and conditioner -",
 " face wash, laundry and more",
 " Sunscreen and face lotion with SPF",
 " Make up packed in a wipeable wristlet",
 " Face wash and/or makeup remover wipes and q-tips",
 " Night time Moisturizer/Lotion",
 " Lip balm with SPF and lipstick or lip gloss",
 " Personal hygiene items",
 " Feminine hygiene products",
 " Extra contacts, solution, and contact case",
 " Glasses and prescription sunglasses",
 " Prescription medication with the label/script so that you can refill if needed and not be
 questioned by TSA.",]
end

  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar, address_attributes: [:country, :state, :city, :area, :postal_code]])
end
end
