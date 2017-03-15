# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

illness1 = Illness.create(name: "Reflukssygdom",
                          description: "Sygdom der skyldes tilbageløb af maveindholdet til spiserøret, hvis slimhinde irriteres. Dette opfattes som halsbrand. Kan medføre cancer med tiden.",
                          etio_and_pato: "Efter fødeindtagelse ses et fysiologisk tilbageløb af maveindholdet. Sygdommen er en senso-motorisk sygdom, hvor den nedre øsofagus-sphincters funktion er reduceret og slimhinden sensitiviseres som følge af gentagen eksponering til syre, pepsin, galde og pancreasenzymer, hvilket medfører de kendetegnende symptomer. TLER, transient lower esophageal sphincter relaxation, beskriver spontane og unormalt forlængede episoder af afslapninger i den nedre sphincter.",
                          incidence: "10",
                          category: "whatever")
illness1.paraclinical = Paraclinical.create(illness_id: illness1,
                                            biopsy: "Ikke indikeret, medmindre der er mistanke om andre øsophaguslidelser",
                                            lfu: "",
                                            ekg: "")
illness1.paraclinical.test = Test.create(paraclinical_id: illness1.paraclinical,
                                         xray: "",
                                         mri: "",
                                         ct: "",
                                         pet: "",
                                         pet_mri: "",
                                         ultrasound: "")
illness1.clinical = Clinical.create(illness_id: illness1,
                                    inspection: "Patienten er smerteforpint?",
                                    palpation: "i.a.",
                                    percussion: "i.a.",
                                    auscultation: "i.a.")