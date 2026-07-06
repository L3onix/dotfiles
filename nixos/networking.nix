{
    config,
    inputs,
    pkgs,
    ...
}:
{
    networking.hostName = "green-bulba"; # Define your hostname.
    networking.hosts = {
        "127.0.0.1" = [
            "localhost"
            # estudacom
            "apps.corel.com"
            "compute-1.amazonaws.com"
            "cpbprova.local"
            "dev1.ipm.corel.public.corel.net"
            "enem.estuda.local"
            "escolas.estuda.local"
            "estuda.local"
            "fariasbrito.estuda.local"
            "fbuni.estuda.local"
            "hexag.estuda.local"
            "home.estuda.local"
            "img.estuda.local"
            "intellectus.estuda.local"
            "interativo.cpbprova.local"
            "interativo.cpbprova.local"
            "ipm.corel.com"
            "iws.corel.com"
            "marista.estuda.local"
            "maristacentronorte.estuda.local"
            "mc.corel.com"
            "oab.estuda.local"
            "omr.estuda.local"
            "origin-mc.corel.com"
            "pdf.estuda.local"
            "rededamas.estuda.local"
            "saebemfoco.estuda.local"
            "salta.estuda.local"
            "simuladaoenem.estuda.local"
            "simulados.estuda.local"
        ];
    };
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;
}