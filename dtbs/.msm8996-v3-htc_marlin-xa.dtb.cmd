cmd_arch/arm64/boot/dts/htc/msm8996-v3-htc_marlin-xa.dtb := /home/kingbri1/dtc/out/8.0/bin/clang -E -Wp,-MD,arch/arm64/boot/dts/htc/.msm8996-v3-htc_marlin-xa.dtb.d.pre.tmp -nostdinc -I../arch/arm64/boot/dts -I../arch/arm64/boot/dts/include -I../drivers/of/testcase-data -undef -D__DTS__ -x assembler-with-cpp -o arch/arm64/boot/dts/htc/.msm8996-v3-htc_marlin-xa.dtb.dts.tmp ../arch/arm64/boot/dts/htc/msm8996-v3-htc_marlin-xa.dts ; ./scripts/dtc/dtc -O dtb -o arch/arm64/boot/dts/htc/msm8996-v3-htc_marlin-xa.dtb -b 0 -i ../arch/arm64/boot/dts/htc/  -d arch/arm64/boot/dts/htc/.msm8996-v3-htc_marlin-xa.dtb.d.dtc.tmp arch/arm64/boot/dts/htc/.msm8996-v3-htc_marlin-xa.dtb.dts.tmp ; cat arch/arm64/boot/dts/htc/.msm8996-v3-htc_marlin-xa.dtb.d.pre.tmp arch/arm64/boot/dts/htc/.msm8996-v3-htc_marlin-xa.dtb.d.dtc.tmp > arch/arm64/boot/dts/htc/.msm8996-v3-htc_marlin-xa.dtb.d

source_arch/arm64/boot/dts/htc/msm8996-v3-htc_marlin-xa.dtb := ../arch/arm64/boot/dts/htc/msm8996-v3-htc_marlin-xa.dts

deps_arch/arm64/boot/dts/htc/msm8996-v3-htc_marlin-xa.dtb := \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-v3.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/skeleton64.dtsi \
  ../arch/arm64/boot/dts/include/dt-bindings/clock/msm-clocks-8996.h \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-ion.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-mdss.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-mdss-pll.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-smp2p.dtsi \
  ../arch/arm64/boot/dts/include/dt-bindings/interrupt-controller/arm-gic.h \
  ../arch/arm64/boot/dts/include/dt-bindings/interrupt-controller/irq.h \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-ipcrouter.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm-gdsc-8996.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-bus.dtsi \
    $(wildcard include/config/noc.h) \
  ../arch/arm64/boot/dts/include/dt-bindings/msm/msm-bus-ids.h \
  ../arch/arm64/boot/dts/htc/../qcom/msm-rdbg.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-blsp.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm-pm8994-rpm-regulator.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm-pm8994.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm-pmi8994.dtsi \
  ../arch/arm64/boot/dts/include/dt-bindings/msm/power-on.h \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-regulator.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-camera.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-gpu.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-pm.dtsi \
  ../arch/arm64/boot/dts/include/dt-bindings/msm/pm.h \
  ../arch/arm64/boot/dts/htc/../qcom/msm-arm-smmu-8996.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm-arm-smmu.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-vidc.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-coresight-v3.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm-arm-smmu-impl-defs-8996-v3.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm-pmi8996.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-mtp.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-pinctrl.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-camera-sensor-mtp.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-wsa881x.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/../../../../arm64/boot/dts/htc/dsi-panel-s1m1-s6e3ha3.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/../../../../arm64/boot/dts/htc/dsi-panel-t50.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/msm8996-mdss-panels.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-sharp-dualmipi-wqxga-video.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-nt35597-dualmipi-wqxga-video.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-nt35597-dualmipi-wqxga-cmd.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-nt35597-dsc-wqxga-video.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-jdi-dualmipi-video.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-jdi-dualmipi-cmd.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-jdi-4k-dualmipi-video-nofbc.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-sim-video.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-sim-dualmipi-video.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-sim-cmd.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-sim-dualmipi-cmd.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-nt35597-dsc-wqxga-cmd.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-hx8379a-truly-fwvga-video.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-r69007-dualdsi-wqxga-cmd.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-adv7533-720p.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-adv7533-1080p.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-nt35950-dsc-4k-cmd.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-sharp-dualmipi-1080p-120hz.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-sharp-1080p-cmd.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-sharp-dsc-4k-video.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/dsi-panel-sharp-dsc-4k-cmd.dtsi \
  ../arch/arm64/boot/dts/htc/../qcom/batterydata-itech-3000mah.dtsi \
  ../arch/arm64/boot/dts/htc/msm8996-nc-pins-htc_marlin-xa.dtsi \
  ../arch/arm64/boot/dts/htc/msm8996-htc_marlin.dtsi \
  ../arch/arm64/boot/dts/htc/msm8996-htc-common.dtsi \
  ../arch/arm64/boot/dts/htc/msm8996-htc-regulator.dtsi \
  ../arch/arm64/boot/dts/htc/msm8996-htc-pm.dtsi \
  ../arch/arm64/boot/dts/htc/msm-pm8996-pmi8996-vreg-dump.dtsi \
  ../arch/arm64/boot/dts/htc/msm8996-htc-nanohub-v2.dtsi \
  ../arch/arm64/boot/dts/htc/msm8996-touch-m1.dtsi \
  ../arch/arm64/boot/dts/htc/msm8996-key-t50.dtsi \
  ../arch/arm64/boot/dts/htc/msm8996-htc-fingerprint.dtsi \
  ../arch/arm64/boot/dts/htc/msm8996-htc-led.dtsi \
  ../arch/arm64/boot/dts/htc/dsi-panel-s1m1-ea8064tg.dtsi \
  ../arch/arm64/boot/dts/htc/dsi-panel-s1m1-s6e3ha3.dtsi \
  ../arch/arm64/boot/dts/htc/dsi-panel-t50.dtsi \
  ../arch/arm64/boot/dts/htc/msm8996-audio-marlin.dtsi \
  ../arch/arm64/boot/dts/htc/msm8996-camera-sensor-m1s1.dtsi \
  ../arch/arm64/boot/dts/htc/msm8996-camera-laser-m1s1.dtsi \
  ../arch/arm64/boot/dts/htc/msm8996-htc-nfc.dtsi \
  ../arch/arm64/boot/dts/htc/msm8996-htc-usb.dtsi \
  ../arch/arm64/boot/dts/include/dt-bindings/usb/typec.h \
  ../arch/arm64/boot/dts/htc/batterydata-m1-id1.dtsi \
  ../arch/arm64/boot/dts/htc/batterydata-m1-id2.dtsi \
  ../arch/arm64/boot/dts/htc/batterydata-m1-id3.dtsi \

arch/arm64/boot/dts/htc/msm8996-v3-htc_marlin-xa.dtb: $(deps_arch/arm64/boot/dts/htc/msm8996-v3-htc_marlin-xa.dtb)

$(deps_arch/arm64/boot/dts/htc/msm8996-v3-htc_marlin-xa.dtb):
