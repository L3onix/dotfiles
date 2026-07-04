{
    config,
    inputs,
    pkgs,
    ...
}:
{
    boot.kernelParams = [ "i915.enable_guc=3" ];
    environment.sessionVariables = {
        GSK_RENDERER= "gl";
        LIBVA_DRIVER_NAME = "iHD";
        MESA_SHADER_CACHE_MAX_SIZE = "12G";
        NIXOS_OZONE_WL = "1";
    };
    hardware = {
        enableAllFirmware = true;
        enableRedistributableFirmware = true;

        firmware = [ pkgs.linux-firmware ];

        graphics = {
            enable = true;
            enable32Bit = true;
            extraPackages = with pkgs; [
                intel-compute-runtime
                intel-media-driver
                vpl-gpu-rt
            ];
            extraPackages32 = with pkgs.pkgsi686Linux; [
                libva
            ];
        };
    };
}