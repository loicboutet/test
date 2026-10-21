# CVE-2026-66066 : libvips ne doit jamais ouvrir un format "non fiable"
# (svg, matload, fits, ppm...) a partir d'un fichier envoye par un visiteur.
# Double de VIPS_BLOCK_UNTRUSTED=1 dans config/deploy.yml.
begin
  require "vips"
  Vips.block_untrusted(true) if Vips.respond_to?(:block_untrusted)
rescue LoadError
  # ruby-vips absente : rien a durcir.
rescue StandardError => e
  warn "[vips_hardening] libvips non durcie : #{e.class}: #{e.message}"
end
