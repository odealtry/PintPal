Geocoder.configure(
  lookup: :nominatim,
  use_https: true,
  http_headers: { "User-Agent" => "PintPal/1.0 (dev)" },
  timeout: 10,
  units: :km,
)
