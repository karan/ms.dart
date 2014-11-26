part of ms;

const int s = 1000;
const int m = s * 60;
const int h = m * 60;
const int d = h * 24;
const int y = d * 365;

/**
 * Parse or format the given [val]
 */
ms(val, [Map options]) {
  if (options == null) options = new Map();

  if (val.runtimeType == String) {
    return parse(val);
  }

  if (options['long'] == true) {
    return long(val);
  } else {
    return short(val);
  }
}


/**
 * Parse [str] and return the milliseconds
 */
num parse(String val) {
  val = val.toLowerCase();
  RegExp tester = new RegExp(r'^((?:\d+)?\.?\d+) *(milliseconds?|msecs?|ms|seconds?|secs?|s|minutes?|mins?|m|hours?|hrs?|h|days?|d|years?|yrs?|y)?$');
  Iterable<Match> match = tester.allMatches(val);

  if (match.length == 0) return -1;

  double n = double.parse(match.first.group(1));
  String type = 'ms';
  if (match.first.group(2) != null) {
    type = match.first.group(2).toLowerCase();
  }

  switch (type) {
    case 'years':
    case 'year':
    case 'yrs':
    case 'yr':
    case 'y':
      return (n * y).toInt();
    case 'days':
    case 'day':
    case 'd':
      return (n * d).toInt();
    case 'hours':
    case 'hour':
    case 'hrs':
    case 'hr':
    case 'h':
      return (n * h).toInt();
    case 'minutes':
    case 'minute':
    case 'mins':
    case 'min':
    case 'm':
      return (n * m).toInt();
    case 'seconds':
    case 'second':
    case 'secs':
    case 'sec':
    case 's':
      return (n * s).toInt();
    case 'milliseconds':
    case 'millisecond':
    case 'msecs':
    case 'msec':
    case 'ms':
      return n;
  }

  return -1;
}


/**
 * Short format for [ms]
 */
String short(int ms) {
  if (ms >= d) return (ms / d).round().toString() + 'd';
  if (ms >= h) return (ms / h).round().toString() + 'h';
  if (ms >= m) return (ms / m).round().toString() + 'm';
  if (ms >= s) return (ms / s).round().toString() + 's';
  return ms.toString() + 'ms';
}


/**
 * Long format for [ms]
 */
String long(int ms) {

  String str = plural(ms, d, 'day');
  if (str != '') return str;

  str = plural(ms, h, 'hour');
  if (str != '') return str;

  str = plural(ms, m, 'minute');
  if (str != '') return str;

  str = plural(ms, s, 'second');
  if (str != '') return str;

  return ms.toString() + ' ms';
}


// Pluralize for human readability
String plural(int ms, n, name) {
  if (ms < n) return '';
  if (ms < n * 1.5) return (ms / n).floor().toString() + ' ' + name;
  return (ms / n).ceil().toString() + ' ' + name + 's';
}
