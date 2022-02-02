enum DamageType {
  acid,
  bludgeoning,
  cold,
  fire,
  force,
  lightning,
  necrotic,
  piercing,
  poison,
  psychic,
  radiant,
  slashing,
  thunder
}

String getString(DamageType d) {
  String res = "";
  switch (d) {
    case DamageType.acid:
      res = "acid";
      break;
    case DamageType.bludgeoning:
      res = "bludgeoning";
      break;
    case DamageType.cold:
      res = "cold";
      break;
    case DamageType.fire:
      res = "fire";
      break;
    case DamageType.force:
      res = "force";
      break;
    case DamageType.lightning:
      res = "lightning";
      break;
    case DamageType.necrotic:
      res = "necrotic";
      break;
    case DamageType.piercing:
      res = "piercing";
      break;
    case DamageType.poison:
      res = "poison";
      break;
    case DamageType.psychic:
      res = "psychic";
      break;
    case DamageType.radiant:
      res = "radiant";
      break;
    case DamageType.slashing:
      res = "slashing";
      break;
    case DamageType.thunder:
      res = "thunder";
      break;

    default:
      res = "";
  }
  return res;
}
