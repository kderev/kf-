return {
  common = {
    stay_bed_body = "Le matelas retient le corps. La journée pèse déjà.",
    job_hunt_body  = "Tu fais défiler des annonces. Des promesses creuses, des exigences impossibles.",
    clinic_body    = "Tu demandes un arrêt. On te regarde comme si tu exagérais.",
    breakfast_body = "Tartines tièdes et chocolat chaud. Un petit déjeuner d'enfant.",
    metro_entry_body = "Tu passes les portiques. Le métal vibre, la rame t'attend.",
    metro_body     = "Les néons sont froids. Les regards sont vides.",
  },

  arcs = {
    dossier27b = {
      { step = 1, total = 3, pages = {
        "Tu ouvres le dossier 27B. Il n'a pas de fin.",
        "Les paragraphes se répètent. Les cases sont vides.",
        "Tu signes là où l'on t'a dit de signer.",
      }},
      { step = 2, total = 3, pages = {
        "Le dossier 27B s'épaissit. Une note contradictoire apparaît.",
        "Tu surlignes, tu corriges, tu recommences.",
        "On te demande d'archiver ce qui n'existe pas.",
      }},
      { step = 3, total = 3, pages = {
        "Tu arrives à la fin. Il y a encore une annexe.",
        "Un responsable signe sans te regarder.",
        "Tu ranges 27B. Demain, un autre t'attend.",
      }},
    },

    rapport8f = {
      { step = 1, total = 2, pages = {
        "On te confie le rapport 8F. Il remplace 27B.",
        "Les pages sont grasses, les chiffres flous.",
        "Tu ratures, tu recopies, tu avances.",
      }},
      { step = 2, total = 2, pages = {
        "Tu relis le rapport 8F. Chaque ligne est une dette.",
        "Tu corriges, tu valides, tu signes.",
        "Le 8F se referme. Ton poignet brûle.",
      }},
    },

    carnetgris = {
      { step = 1, total = 3, pages = {
        "Tu reçois un carnet gris. Aucune consigne claire.",
        "Tu recopies des phrases vides. Les doigts tachent l'encre.",
        "On te dit de recommencer demain.",
      }},
      { step = 2, total = 3, pages = {
        "Le carnet grossit. Tu recopies une procédure absurde.",
        "Un supérieur rature ta ligne. Tu recommences.",
        "La journée s'épuise en papier.",
      }},
      { step = 3, total = 3, pages = {
        "Tu termines le carnet gris. Le geste devient automatique.",
        "Une ligne te rappelle le café. Tu hésites.",
        "Tu ranges le carnet. Quelque chose revient.",
      }},
    },

    registre4k = {
      { step = 1, total = 2, pages = {
        "Le registre 4K arrive. Il sent la graisse froide.",
        "Tu recopies des chiffres à la main.",
        "Chaque page t'enfonce un peu plus.",
      }},
      { step = 2, total = 2, pages = {
        "Le registre 4K se referme. Tu relis ta dernière ligne.",
        "Une rumeur de café traverse l'atelier.",
        "Tu sais que tu n'es pas fini.",
      }},
    },
  },

  weeks = {
    [1] = {
      days = {
        [1] = { title = "Lundi",     wakeup_body = "Encore une journée identique. L'alarme martèle le crâne." },
        [2] = { title = "Mardi",     wakeup_body = "Le réveil n'est plus un bruit. C'est une punition." },
        [3] = { title = "Mercredi",  wakeup_body = "Le corps se lève tout seul. L'esprit reste au lit." },
        [4] = { title = "Jeudi",     wakeup_body = "La semaine pèse. Les murs aussi." },
        [5] = { title = "Vendredi",  wakeup_body = "Tu comptes les heures. Elles se vengent." },
      },
      work = {
        [1] = {
          title = "Bureau",
          body  = "Trois mini-jeux à réussir pour tenir la journée.",
          timing  = { id="d1_timing",  title="Tampon parfait",     summary="Arrête l'aiguille dans la zone rouge.", target_size=0.18 },
          tapping = { id="d1_tapping", title="Tri express",        summary="Tape 9 fois en 5 secondes.", goal=9,  seconds=5 },
          story   = { id="d1_story",   title="Dossier 27B — Jour 1/3", summary="Lecture interminable, page 1.", arc="dossier27b", arc_step=1 },
        },
        [2] = {
          title = "Bureau",
          body  = "La routine se durcit. Trois mini-jeux te tombent dessus.",
          timing  = { id="d2_timing",  title="Scan précis",        summary="Stoppe l'aiguille dans le centre.", target_size=0.14 },
          tapping = { id="d2_tapping", title="Relances furieuses", summary="Tape 10 fois en 5 secondes.", goal=10, seconds=5 },
          story   = { id="d2_story",   title="Dossier 27B — Jour 2/3", summary="Lecture interminable, page 2.", arc="dossier27b", arc_step=2 },
        },
        [3] = {
          title = "Bureau",
          body  = "La pression monte. Trois mini-jeux de plus.",
          timing  = { id="d3_timing",  title="Tampon d'urgence",   summary="La zone est plus petite.", target_size=0.12 },
          tapping = { id="d3_tapping", title="Clavier fou",        summary="Tape 11 fois en 5 secondes.", goal=11, seconds=5 },
          story   = { id="d3_story",   title="Dossier 27B — Jour 3/3", summary="Lecture interminable, page 3.", arc="dossier27b", arc_step=3 },
        },
        [4] = {
          title = "Bureau",
          body  = "Le rythme ne lâche pas. Trois mini-jeux encore.",
          timing  = { id="d4_timing",  title="Scan nerveux",       summary="La zone est fine.", target_size=0.10 },
          tapping = { id="d4_tapping", title="Relances en rafale", summary="Tape 12 fois en 6 secondes.", goal=12, seconds=6 },
          story   = { id="d4_story",   title="Rapport 8F — Jour 1/2", summary="Dossier long et ingrat.", arc="rapport8f", arc_step=1 },
        },
        [5] = {
          title = "Bureau",
          body  = "Dernière ligne droite. Trois mini-jeux pour tenir.",
          timing  = { id="d5_timing",  title="Tampon final",       summary="Respire, vise, stoppe.", target_size=0.16 },
          tapping = { id="d5_tapping", title="Saisie éclair",      summary="Tape 10 fois en 4 secondes.", goal=10, seconds=4 },
          story   = { id="d5_story",   title="Rapport 8F — Jour 2/2", summary="Finir le dossier coûte que coûte.", arc="rapport8f", arc_step=2 },
        },
      },
    },

    [2] = {
      days = {
        [1] = { title = "Semaine 2 — Lundi",    wakeup_body = "Un job ingrat pour tenir debout. Tu recommences." },
        [2] = { title = "Semaine 2 — Mardi",    wakeup_body = "Tu as mal partout. Mais tu tiens." },
        [3] = { title = "Semaine 2 — Mercredi", wakeup_body = "Tu sais pourquoi tu le fais. Tenir, pour recommencer." },
        [4] = { title = "Semaine 2 — Jeudi",    wakeup_body = "La routine reprend forme. Quelque chose revient." },
        [5] = { title = "Semaine 2 — Vendredi", wakeup_body = "Tu tiens encore. Et tu te souviens." },
      },
      work = {
        [1] = {
          title = "Boulot ingrat",
          body  = "Nouvelle routine. Trois mini-jeux pour survivre.",
          timing  = { id="w2_d1_timing",  title="Machine bruyante",   summary="Arrête au bon moment.", target_size=0.18 },
          tapping = { id="w2_d1_tapping", title="Cartons empilés",    summary="Tape 9 fois en 5 secondes.", goal=9,  seconds=5 },
          story   = { id="w2_d1_story",   title="Carnet gris — Jour 1/3", summary="Tu recopies des lignes sans fin.", arc="carnetgris", arc_step=1 },
        },
        [2] = {
          title = "Boulot ingrat",
          body  = "Encore trois mini-jeux.",
          timing  = { id="w2_d2_timing",  title="Chariot instable",   summary="Zone étroite.", target_size=0.14 },
          tapping = { id="w2_d2_tapping", title="Badges anonymes",    summary="Tape 10 fois en 5 secondes.", goal=10, seconds=5 },
          story   = { id="w2_d2_story",   title="Carnet gris — Jour 2/3", summary="Les pages s'empilent.", arc="carnetgris", arc_step=2 },
        },
        [3] = {
          title = "Boulot ingrat",
          body  = "Encore trois mini-jeux.",
          timing  = { id="w2_d3_timing",  title="Machine bruyante",   summary="Stoppe dans la zone.", target_size=0.12 },
          tapping = { id="w2_d3_tapping", title="Produits sans fin",  summary="Tape 11 fois en 5 secondes.", goal=11, seconds=5 },
          story   = { id="w2_d3_story",   title="Carnet gris — Jour 3/3", summary="Dernier lot, derniers gestes.", arc="carnetgris", arc_step=3 },
        },
        [4] = {
          title = "Boulot ingrat",
          body  = "Encore trois mini-jeux.",
          timing  = { id="w2_d4_timing",  title="Stock renversé",     summary="Zone fine, geste précis.", target_size=0.10 },
          tapping = { id="w2_d4_tapping", title="Vitre opaque",       summary="Tape 12 fois en 6 secondes.", goal=12, seconds=6 },
          story   = { id="w2_d4_story",   title="Registre 4K — Jour 1/2", summary="Dossier encore plus lourd.", arc="registre4k", arc_step=1 },
        },
        [5] = {
          title = "Boulot ingrat",
          body  = "Dernier effort. Trois mini-jeux pour finir.",
          timing  = { id="w2_d5_timing",  title="Caisse cassée",      summary="Stoppe dans la zone.", target_size=0.16 },
          tapping = { id="w2_d5_tapping", title="Chariots fatigués",  summary="Tape 10 fois en 4 secondes.", goal=10, seconds=4 },
          story   = { id="w2_d5_story",   title="Registre 4K — Jour 2/2", summary="Fermer le registre.", arc="registre4k", arc_step=2 },
        },
      },
    },
  },

  specials = {
    coffee = {
      background = "bg_coffee",
      title = "Révélation",
      body  = "Une gorgée. Le monde se dessine en rouge. Tout semble possible.",
      choices = { "Boire", "Partir" },
    },
    contagion = {
      background = "bg_coffee",
      title = "Contagion",
      body  = "Tu parles du café comme d'une faille. Certains écoutent.",
      choices = { "Convaincre", "Provoquer" },
    },
    revolt = {
      background = "bg_revolt",
      title = "Révolution",
      body  = "Les banderoles claquent. Tu sens la foule vibrer.",
      choices = { "Brûler", "Reconstruire" },
    },

    fired = {
      background = "bg_tv",
      title = "Licenciement",
      body  = "Performance insuffisante. Badge retiré. Le silence est lourd.",
      choices = { "Allumer la télé", "Postuler à un job ingrat" },
    },
    tv_day1 = {
      background = "bg_tv",
      title = "Télé",
      body  = "Tu restes devant l'écran. Les slogans tournent en boucle.",
      choices = { "Rester devant la télé" },
    },
    tv_day2 = {
      background = "bg_tv",
      title = "Télé",
      body  = "On te répète que les Cendrés ont volé ton travail.",
      choices = { "Rester devant la télé" },
    },
    tv_day3 = {
      background = "bg_tv",
      title = "Télé",
      body  = "Tu glisses vers des idées extrêmes. Le monde se réduit à un ennemi inventé.",
      choices = { "Rester devant la télé" },
    },
    game_over = {
      background = "bg_tv",
      title = "Fin",
      body  = "Le monde s'est fermé. Tu t'es perdu.",
      choices = { "Recommencer" },
    },
  },
}
