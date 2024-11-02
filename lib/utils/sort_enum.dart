enum SortEnum {
  nameDesc('Po nazwie, malejąco'),
  nameAsc('Po nazwie, rosnąco'),
  dateDesc('Po dacie, malejąco'),
  dateAsc('Po dacie, rosnąco');

  const SortEnum(this.serverValue);

  final String serverValue;

  String order() {
    switch (this) {
      case nameDesc:
      case dateDesc:
        return 'desc';
      case nameAsc:
      case dateAsc:
        return 'asc';
    }
  }

  String sortBy() {
    switch (this) {
      case nameDesc:
      case nameAsc:
        return 'name';
      case dateDesc:
      case dateAsc:
        return 'date';
    }
  }
}