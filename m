From: "David Dabbs" <david@dabbs.net>
Subject: RE: mongo_copy: cp: cannot stat `/mnt/testfs/testdir0-0-0/f92': Input/output error
Date: Wed, 4 Aug 2004 13:24:13 -0500
Message-ID: <20040804182719.1B88515C4D@mail03.powweb.com>
References: <41111F2C.6090805@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19990-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41111F2C.6090805@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Hans Reiser' <reiser@namesys.com>
Cc: "'Vladimir V. Saveliev'" <vs@namesys.com>, reiserfs-list@namesys.com



> -----Original Message-----
> From: Hans Reiser [mailto:reiser@namesys.com]
> Sent: Wednesday, August 04, 2004 12:39 PM
> To: David Dabbs
> Cc: 'Vladimir V. Saveliev'; reiserfs-list@namesys.com
> Subject: Re: mongo_copy: cp: cannot stat `/mnt/testfs/testdir0-0-0/f92':
> Input/output error
> 
> Please do whatever you can to reproduce this.  We are going to delay
> release by one day to see if it can be reproduced.  Vs thinks it might
> be a hardware problem, I am not so optimistic, what are your thoughts?
> 
> Hans
> 
> David Dabbs wrote:
> 
> >This is different from the mount issue, which was fixed by the new code
> >drop. This was built with 8k stacks.
> >
> >David
> >

Hardware was my initial thought, perhaps something related to USB and
switching the KVM. Of course, operator error and/or software are usually the
culprit, so I spent a good bit of time last night rerunning that mongo
config under a number of scenarios, none of which reproduced the errors. 

I'm not a hardware guy, so here's a sample of the messages when switching
the kvm between linux and the other machine.



linux kernel: usb 1-2: USB disconnect, address 8
linux /etc/hotplug/usb.agent[10578]: need a device for this command
linux kernel: usb 1-2: new full speed USB device using address 11
linux kernel: hub 1-2:1.0: USB hub found
linux kernel: hub 1-2:1.0: 5 ports detected
linux kernel: usb 1-2.5: new full speed USB device using address 12
linux kernel: drivers/usb/input/hid-core.c: ctrl urb status -32 received
linux kernel: input: USB HID v1.00 Keyboard [FTDI  PS/2 Keyboard And Mouse
I/F] on usb-0000:00:07.2-2.5
linux kernel: drivers/usb/input/hid-core.c: ctrl urb status -32 received
linux kernel: drivers/usb/input/hid-core.c: ctrl urb status -32 received
linux kernel: input: USB HID v1.00 Mouse [FTDI  PS/2 Keyboard And Mouse I/F]
on usb-0000:00:07.2-2.5
linux /etc/hotplug/usb.agent[10613]: need a device for this command
linux /etc/hotplug/usb.agent[10616]: need a device for this command
linux /etc/hotplug/usb.agent[10611]: need a device for this command
linux kernel: usb 1-2: USB disconnect, address 11
linux kernel: usb 1-2.5: USB disconnect, address 12
linux /etc/hotplug/usb.agent[11210]: need a device for this command
linux /etc/hotplug/usb.agent[11220]: need a device for this command
linux /etc/hotplug/usb.agent[11206]: need a device for this command
linux kernel: usb 1-2: new full speed USB device using address 13
linux kernel: hub 1-2:1.0: USB hub found
linux kernel: hub 1-2:1.0: 5 ports detected
linux /etc/hotplug/usb.agent[11384]: need a device for this command
linux kernel: usb 1-2.5: new full speed USB device using address 14
linux kernel: drivers/usb/input/hid-core.c: ctrl urb status -32 received
linux kernel: drivers/usb/input/hid-core.c: ctrl urb status -71 received
linux kernel: input: USB HID v1.00 Keyboard [FTDI  PS/2 Keyboard And Mouse
I/F] on usb-0000:00:07.2-2.5
linux kernel: usbhid: probe of 1-2.5:1.1 failed with error -5
linux /etc/hotplug/usb.agent[11432]: need a device for this command
linux /etc/hotplug/usb.agent[11421]: need a device for this command
linux kernel: usb 1-2: USB disconnect, address 13
linux kernel: usb 1-2.5: USB disconnect, address 14
linux /etc/hotplug/usb.agent[11731]: need a device for this command
linux /etc/hotplug/usb.agent[11733]: need a device for this command
linux /etc/hotplug/usb.agent[11730]: need a device for this command
linux kernel: usb 1-2: new full speed USB device using address 15
linux kernel: usb 1-2: device not accepting address 15, error -71
linux kernel: usb 1-2: new full speed USB device using address 16
linux kernel: hub 1-2:1.0: USB hub found
linux kernel: hub 1-2:1.0: 5 ports detected
linux /etc/hotplug/usb.agent[11854]: need a device for this command
linux kernel: usb 1-2.5: new full speed USB device using address 17
linux kernel: usb 1-2.5: device descriptor read/8, error -71
linux kernel: usb 1-2.5: new full speed USB device using address 18
linux kernel: usb 1-2.5: device descriptor read/8, error -71


In addition, here is a sample of /var/log/messages from a start-up. If vs
suspects hardware, perhaps something will stick out in here:

syslogd 1.4.1: restart.
 kernel: klogd 1.4.1, log source = /proc/kmsg started.
 kernel: Inspecting /boot/System.map-2.6.8-rc2-mm1
 kernel: Loaded 36084 symbols from /boot/System.map-2.6.8-rc2-mm1.
 kernel: Symbols match kernel version 2.6.8.
 kernel: No module symbols loaded - kernel modules not enabled.

...
This seems strange. I definitely have kernel modules configured in:

# Loadable module support
#
CONFIG_MODULES=y
CONFIG_MODULE_UNLOAD=y
CONFIG_MODULE_FORCE_UNLOAD=y
CONFIG_OBSOLETE_MODPARM=y
CONFIG_MODVERSIONS=y
CONFIG_KMOD=y

...

 kernel: usbcore: registered new driver usbfs
 kernel: usbcore: registered new driver hub
 kernel: PCI: Found IRQ 11 for device 0000:00:11.0
 kernel: PCI: Sharing IRQ 11 with 0000:00:07.2
 kernel: 3c59x: Donald Becker and others. www.scyld.com/network/vortex.html
 kernel: 0000:00:11.0: 3Com PCI 3c905 Boomerang 100baseTx at 0xdc80. Vers
LK1.1.19
 kernel:  ***INVALID CHECKSUM 003e*** eth0: Dropping NETIF_F_SG since no
checksum feature.
 kernel: NET: Registered protocol family 17
 kernel: Linux agpgart interface v0.100 (c) Dave Jones
 kernel: agpgart: Detected an Intel 440LX Chipset.
 kernel: agpgart: Maximum main memory to use for agp memory: 263M
 kernel: agpgart: AGP aperture is 64M @ 0xf4000000
 kernel: USB Universal Host Controller Interface driver v2.2
 kernel: PCI: Found IRQ 11 for device 0000:00:07.2
 kernel: PCI: Sharing IRQ 11 with 0000:00:11.0
 kernel: uhci_hcd 0000:00:07.2: Intel Corp. 82371AB/EB/MB PIIX4 USB
 kernel: uhci_hcd 0000:00:07.2: irq 11, io base 0000dce0
 kernel: uhci_hcd 0000:00:07.2: new USB bus registered, assigned bus number
1
 kernel: hub 1-0:1.0: USB hub found
 kernel: hub 1-0:1.0: 2 ports detected
 kernel: usb 1-2: new full speed USB device using address 2
 kernel: hub 1-2:1.0: USB hub found
 kernel: hub 1-2:1.0: 5 ports detected
 kernel: usb 1-2.5: new full speed USB device using address 3
 kernel: usbcore: registered new driver hiddev
 kernel: drivers/usb/input/hid-core.c: ctrl urb status -32 received
 kernel: input: USB HID v1.00 Keyboard [FTDI  PS/2 Keyboard And Mouse I/F]
on usb-0000:00:07.2-2.5
 kernel: usbhid: probe of 1-2.5:1.1 failed with error -5
 kernel: usbcore: registered new driver usbhid
 kernel: drivers/usb/input/hid-core.c: v2.0:USB HID core driver
 kernel: NET: Registered protocol family 10
 kernel: Disabled Privacy Extensions on device c04519e0(lo)
 kernel: IPv6 over IPv4 tunneling driver
 kernel: Disabled Privacy Extensions on device d2293000(sit0)
 sshd[2626]: Server listening on :: port 22.
 kernel: pnp: Device 00:01.00 activated.
 kernel: pnp: Device 00:01.02 activated.
 kernel: pnp: Device 00:01.03 activated.
 kernel: speedstep_centrino: Unknown symbol
acpi_processor_unregister_performance
 kernel: speedstep_centrino: Unknown symbol
acpi_processor_register_performance
 kernel: powernow_k8: Unknown symbol acpi_processor_unregister_performance
 kernel: powernow_k8: Unknown symbol acpi_processor_register_performance
 kernel: powernow_k7: Unknown symbol acpi_processor_unregister_performance
 kernel: powernow_k7: Unknown symbol acpi_processor_register_performance
 rcpowersaved: CPU frequency scaling is not supported by your processor.
 rcpowersaved: enter 'POWERSAVE_CPUFREQD_MODULE=off' in
/etc/sysconfig/powersave/common to avoid this warning.
 [powersaved][2905]: resmgr: server response code 200
 kernel: hda: drive_cmd: status=0x51 { DriveReady SeekComplete Error }
 kernel: hda: drive_cmd: error=0x04 { DriveStatusError }
 kernel: ide: failed opcode was: 0xef
 [powersave_proxy][2907]: WARNING: hdparm returned error 5
 kernel: hda: task_no_data_intr: status=0x51 { DriveReady SeekComplete Error
}
 kernel: hda: task_no_data_intr: error=0x04 { DriveStatusError }
 kernel: ide: failed opcode was: 0xef
 [powersave_proxy][2907]: WARNING: hdparm returned error 5
 ifup: No configuration found for sit0
 kernel: hdb: drive_cmd: status=0x51 { DriveReady SeekComplete Error }
 kernel: hdb: drive_cmd: error=0x04 { DriveStatusError }
 kernel: ide: failed opcode was: 0xef
 kernel: eth0: no IPv6 routers present
 kernel: parport0: PC-style at 0x378 (0x778) [PCSPP,TRISTATE,EPP]
 kernel: parport0: irq 7 detected
 kernel: lp0: using parport0 (polling).
 kernel: drivers/usb/serial/usb-serial.c: USB Serial support registered for
Generic
 kernel: usbcore: registered new driver usbserial_generic
 kernel: usbcore: registered new driver usbserial
 kernel: drivers/usb/serial/usb-serial.c: USB Serial Driver core v2.0
 kernel: drivers/usb/input/hid-core.c: ctrl urb status -71 received
 xinetd[8560]: Reading included configuration file: /etc/xinetd.d/chargen
[file=/etc/xinetd.conf] [line=26]
 xinetd[8560]: Reading included configuration file:
/etc/xinetd.d/chargen-udp [file=/etc/xinetd.d/chargen-udp] [line

 xinetd[8560]: Reading included configuration file: /etc/xinetd.d/cups-lpd
[file=/etc/xinetd.d/cups-lpd] [line=14]
 xinetd[8560]: Reading included configuration file: /etc/xinetd.d/daytime
[file=/etc/xinetd.d/daytime] [line=11]
 xinetd[8560]: Reading included configuration file:
/etc/xinetd.d/daytime-udp [file=/etc/xinetd.d/daytime-udp] [line

 xinetd[8560]: Reading included configuration file: /etc/xinetd.d/echo
[file=/etc/xinetd.d/echo] [line=14]
 xinetd[8560]: Reading included configuration file: /etc/xinetd.d/echo-udp
[file=/etc/xinetd.d/echo-udp] [line=13]
 xinetd[8560]: Reading included configuration file: /etc/xinetd.d/netstat
[file=/etc/xinetd.d/netstat] [line=14]
 xinetd[8560]: Reading included configuration file: /etc/xinetd.d/rsync
[file=/etc/xinetd.d/rsync] [line=16]
 xinetd[8560]: Reading included configuration file: /etc/xinetd.d/servers
[file=/etc/xinetd.d/servers] [line=12]
 xinetd[8560]: Reading included configuration file: /etc/xinetd.d/services
[file=/etc/xinetd.d/services] [line=13]
 xinetd[8560]: Reading included configuration file: /etc/xinetd.d/swat
[file=/etc/xinetd.d/swat] [line=13]
 xinetd[8560]: Reading included configuration file: /etc/xinetd.d/systat
[file=/etc/xinetd.d/systat] [line=11]
 xinetd[8560]: Reading included configuration file: /etc/xinetd.d/time
[file=/etc/xinetd.d/time] [line=17]
 xinetd[8560]: Reading included configuration file: /etc/xinetd.d/time-udp
[file=/etc/xinetd.d/time-udp] [line=14]
 xinetd[8560]: Reading included configuration file: /etc/xinetd.d/vnc
[file=/etc/xinetd.d/vnc] [line=14]
 /usr/sbin/cron[8609]: (CRON) STARTUP (fork ok)
 xinetd[8560]: removing chargen
 xinetd[8560]: removing chargen
 xinetd[8560]: removing printer
 xinetd[8560]: removing daytime
 xinetd[8560]: removing daytime
 xinetd[8560]: removing echo
 xinetd[8560]: removing echo
 xinetd[8560]: removing netstat
 xinetd[8560]: removing rsync
 xinetd[8560]: removing servers
 xinetd[8560]: removing services
 xinetd[8560]: removing systat
 xinetd[8560]: removing time
 xinetd[8560]: removing vnc1
 xinetd[8560]: removing vnc2
 xinetd[8560]: removing vnc3
 xinetd[8560]: removing vnchttpd1
 xinetd[8560]: removing vnchttpd2
 xinetd[8560]: removing vnchttpd3
 xinetd[8560]: xinetd Version 2.3.13 started with libwrap loadavg options
compiled in.
 xinetd[8560]: Started working: 1 available service
 kernel: Non-volatile memory driver v1.2
 kernel: end_request: I/O error, dev fd0, sector 0
 kernel: end_request: I/O error, dev fd0, sector 0
 kernel: SCSI subsystem initialized
 kernel: st: Version 20040403, fixed bufsize 32768, s/g segs 256
 kernel: BIOS EDD facility v0.16 2004-Jun-25, 1 devices found
 kernel: usb 1-2: USB disconnect, address 2
 kernel: usb 1-2.5: USB disconnect, address 3
 /etc/hotplug/usb.agent[8706]: need a device for this command
 /etc/hotplug/usb.agent[8695]: need a device for this command
 /etc/hotplug/usb.agent[8696]: need a device for this command
 kernel: mtrr: 0xfd000000,0x400000 overlaps existing 0xfd000000,0x200000
 kernel: mtrr: 0xfd000000,0x400000 overlaps existing 0xfd000000,0x200000


David


