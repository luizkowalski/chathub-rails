function nFormatter(num) {
  if (num >= 1000000000) {
    return (num / 1000000000).toFixed(1) + 'G';
  }

  if (num >= 1000000) {
    return (num / 1000000).toFixed(1) + 'Mi';
  }

  if (num >= 1000) {
    return (num / 1000).toFixed(1) + 'K';
  }

  return num;
}