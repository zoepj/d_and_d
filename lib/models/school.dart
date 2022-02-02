enum School {
  abjuration,
  conjuration,
  divination,
  enchantment,
  evocation,
  illusion,
  necromancy,
  transmutation
}

String getSchoolString(School s) {
  String res = "";
  switch (s) {
    case School.abjuration:
      res = "abjuration";
      break;
    case School.conjuration:
      res = "conjuration";
      break;
    case School.divination:
      res = "divination";
      break;
    case School.enchantment:
      res = "enchantment";
      break;
    case School.evocation:
      res = "evocation";
      break;
    case School.illusion:
      res = "illusion";
      break;
    case School.necromancy:
      res = "necromancy";
      break;
    case School.transmutation:
      res = "transmutation";
      break;

    default:
      res = "";
  }
  return res;
}
