From: Danny Sauer <reiserfs@danny.teleologic.net>
Subject: problem with reiser3/2.4 on 3Ware RAID10
Date: Tue, 5 Apr 2005 10:54:13 -0500
Message-ID: <20050405155413.GB22228@teleologic.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Return-path: <reiserfs-list-return-23782-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--DKU6Jbt7q3WqK7+M
Content-Type: multipart/mixed; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm having a hard time finding a solution to this, and therefore I'm
hoping someone this this list might have an idea of what's going on.

First, some background.  I have a 1GHz Athlon machine running as a web
and email server, as well as hosting home directories.  As I'm using
homedir-based maildir mail spools, Reiser is the obvious choice to
hold a whole bunch of small files.  I've had good luck with it for the
past ~5 years on this machine, and have had to increase storage
capacity twice.  Last week, it was time to add capacity again.  So, I
picked up a 3Ware 7506 P-ATA RAID card, 4 Seagate drives, and set them
up in a RAID-10.  Then I set about migrating the data from the
existing drive (a Seagate Cheeta on a Symbios SCSI card).  As I had to
reboot the machine anyway, I built a new 2.4.29 kernel using the same
=2Econfig as the previous working kernels, but with the addition of the
3Ware driver built in.  The reiser utils and kernel were both built on
this SuSE 7.1 box (glibc-2.2-17, etc), and the only weird thing I did
with the reiser utils build was specify build them using rpm -ta,
using the .spec file included in the tarball, while running the
previous 2.4.27 kernel.

As I plan to use evms to manage this drives space, I just created a
100GB partition on the RAID with fdisk to test with.  I made a reiser3
partition using mkreiserfs 3.6.18 with the default options (though,
I'm using a 256K stripe on the RAID, as opposed to the 64K default -
the manual said that a larger stripe is better for lots of small
random reads, which is what my mailspool will be doing).  I mounted
the partition in a temporary location, and used rsync to start copying
files over (rsync -aHW /src/path1 /src/path2 /destination/path/).  I
used rsync instead of something like a tar pipe or cp, because I
wanted to make sure that hard links are preserved - and because I like
rsync.

The copy process will crash the kernel rsync driver every time, at
about the same point.  So, I tried making another smaller partition
and used ext2.  No problem.  With reiser, the same problem.  "Maybe
it's the write caching on the 3Ware card", I thought to myself.
That's just a guess, since the 3Ware link referenced from namesys.com
doesn't exist any more.  Anyway, I disabled write caching, recreaed
the 100GB filesystem (after a reboot - when the crash occurs, the
block device is still locked and won't unmount, and I have to reboot
with the reset button).  I disabled the write cache, and thought all
was well.  However, it still hung up later on in the copy process
today.

I've attached the ksymoops-parsed output of the kernel oops.  I've not
seen this on any other drives on this machine, and several of them run
Reiser as well.  I've not seen this on any other 3Ware-equipped
machines, either, though I'm only running RAID-1 on other machines
(and ReiserFS).

Here's a few lines from dmesg. =20

These repeat several times:
sd(8,49):vs-5150: search_by_key: invalid format found in block 3832906. Fsc=
k?
sd(8,49):vs-13050: reiserfs_update_sd: i/o failure occurred trying to updat=
e [280043 280046 0x0 SD] stat data
is_leaf: wrong item type for item *3.5*[280043 280044 0x1 DIRECT], item_len=
 16, item_location 3396, free_space(entry_count) 0
sd(8,49):vs-5150: search_by_key: invalid format found in block 3832906. Fsc=
k?
sd(8,49):vs-13050: reiserfs_update_sd: i/o failure occurred trying to updat=
e [280043 280047 0x0 SD] stat data
is_leaf: wrong item type for item *3.5*[280043 280044 0x1 DIRECT], item_len=
 16, item_location 3396, free_space(entry_count) 0

Then this repeats several times:
sd(8,49):vs-13060: reiserfs_update_sd: stat data of object [769 786 0x0 SD]=
 (nlink =3D=3D 2) not found (pos 24)
sd(8,49):vs-13060: reiserfs_update_sd: stat data of object [769 786 0x0 SD]=
 (nlink =3D=3D 2) not found (pos 24)

Then this finally happens:
vs-7050: new entry is found, new inode =3D=3D 0
 (device sd(8,49))
kernel BUG at prints.c:341!
invalid operand: 0000
CPU:    0
EIP:    0010:[<c0196e04>]    Not tainted
EFLAGS: 00010286
eax: 00000042   ebx: c02dca60   ecx: f472a000   edx: db2e4a80
esi: f1191000   edi: ffffffef   ebp: f472bf0c   esp: f472bcbc
ds: 0018   es: 0018   ss: 0018
Process rsync (pid: 13930, stackpage=3Df472b000)
Stack: c02deafb c03b0ba0 c03ad8c0 00000831 c02dca60 f472bce8 d989e6c0 f472b=
dc0=20
       c018c02d f1191000 c02dca60 d989e750 d989e750 d989e6c0 81b4be10 c44b3=
740=20
       f472bddc f472be98 00000000 00000000 00000000 00000000 00000001 00000=
000=20
Call Trace:    [<c018c02d>] [<c01a43f6>] [<c01379c9>] [<c01379c9>] [<c01379=
f0>]
  [<c019be57>] [<c01a4a0e>] [<c01a4f06>] [<c0141947>] [<c01419e9>] [<c0141b=
ac>]
  [<c0106c77>]

Code: 0f 0b 55 01 0e eb 2d c0 68 a0 0b 3b c0 85 f6 74 0f 0f b7 46=20

I'm just guessing here, but I'm thinking this shouldn't be happening.
I'd much appreciate any thoughts on the matter.

Thanks.
--Danny

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=outfile3

ksymoops 2.4.0 on i686 2.4.29.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.29/ (default)
     -m /usr/src/linux/System.map (specified)

Warning (compare_maps): ksyms_base symbol acpi_acquire_global_lock_R__ver_acpi_acquire_global_lock not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_bus_generate_event_R__ver_acpi_bus_generate_event not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_bus_get_device_R__ver_acpi_bus_get_device not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_bus_get_power_R__ver_acpi_bus_get_power not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_bus_get_status_R__ver_acpi_bus_get_status not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_bus_receive_event_R__ver_acpi_bus_receive_event not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_bus_register_driver_R__ver_acpi_bus_register_driver not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_bus_scan_R__ver_acpi_bus_scan not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_bus_set_power_R__ver_acpi_bus_set_power not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_bus_unregister_driver_R__ver_acpi_bus_unregister_driver not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_clear_event_R__ver_acpi_clear_event not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_disable_event_R__ver_acpi_disable_event not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_enable_event_R__ver_acpi_enable_event not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_enter_sleep_state_R__ver_acpi_enter_sleep_state not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_enter_sleep_state_s4bios_R__ver_acpi_enter_sleep_state_s4bios not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_evaluate_integer_R__ver_acpi_evaluate_integer not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_evaluate_object_R__ver_acpi_evaluate_object not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_evaluate_reference_R__ver_acpi_evaluate_reference not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_extract_package_R__ver_acpi_extract_package not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_fadt_R__ver_acpi_fadt not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_get_current_resources_R__ver_acpi_get_current_resources not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_get_devices_R__ver_acpi_get_devices not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_get_firmware_table_R__ver_acpi_get_firmware_table not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_get_handle_R__ver_acpi_get_handle not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_get_name_R__ver_acpi_get_name not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_get_next_object_R__ver_acpi_get_next_object not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_get_object_info_R__ver_acpi_get_object_info not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_get_parent_R__ver_acpi_get_parent not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_get_possible_resources_R__ver_acpi_get_possible_resources not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_get_register_R__ver_acpi_get_register not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_get_sleep_type_data_R__ver_acpi_get_sleep_type_data not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_get_system_info_R__ver_acpi_get_system_info not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_get_table_R__ver_acpi_get_table not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_get_timer_R__ver_acpi_get_timer not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_get_timer_duration_R__ver_acpi_get_timer_duration not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_get_type_R__ver_acpi_get_type not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_init_R__ver_acpi_init not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_install_address_space_handler_R__ver_acpi_install_address_space_handler not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_install_fixed_event_handler_R__ver_acpi_install_fixed_event_handler not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_install_gpe_block_R__ver_acpi_install_gpe_block not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_install_gpe_handler_R__ver_acpi_install_gpe_handler not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_install_notify_handler_R__ver_acpi_install_notify_handler not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_os_create_semaphore_R__ver_acpi_os_create_semaphore not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_os_delete_semaphore_R__ver_acpi_os_delete_semaphore not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_os_free_R__ver_acpi_os_free not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_os_printf_R__ver_acpi_os_printf not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_os_queue_for_execution_R__ver_acpi_os_queue_for_execution not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_os_read_pci_configuration_R__ver_acpi_os_read_pci_configuration not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_os_signal_R__ver_acpi_os_signal not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_os_signal_semaphore_R__ver_acpi_os_signal_semaphore not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_os_sleep_R__ver_acpi_os_sleep not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_os_stall_R__ver_acpi_os_stall not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_os_wait_semaphore_R__ver_acpi_os_wait_semaphore not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_pci_irq_enable_R__ver_acpi_pci_irq_enable not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_pci_irq_lookup_R__ver_acpi_pci_irq_lookup not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_pci_register_driver_R__ver_acpi_pci_register_driver not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_pci_unregister_driver_R__ver_acpi_pci_unregister_driver not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_processor_set_thermal_limit_R__ver_acpi_processor_set_thermal_limit not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_release_global_lock_R__ver_acpi_release_global_lock not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_remove_address_space_handler_R__ver_acpi_remove_address_space_handler not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_remove_fixed_event_handler_R__ver_acpi_remove_fixed_event_handler not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_remove_gpe_block_R__ver_acpi_remove_gpe_block not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_remove_gpe_handler_R__ver_acpi_remove_gpe_handler not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_remove_notify_handler_R__ver_acpi_remove_notify_handler not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_root_dir_R__ver_acpi_root_dir not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_set_current_resources_R__ver_acpi_set_current_resources not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_set_register_R__ver_acpi_set_register not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_walk_namespace_R__ver_acpi_walk_namespace not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol acpi_walk_resources_R__ver_acpi_walk_resources not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol crypto_alg_available_R__ver_crypto_alg_available not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol crypto_alloc_tfm_R__ver_crypto_alloc_tfm not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol crypto_free_tfm_R__ver_crypto_free_tfm not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol crypto_hmac_R__ver_crypto_hmac not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol crypto_hmac_final_R__ver_crypto_hmac_final not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol crypto_hmac_init_R__ver_crypto_hmac_init not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol crypto_hmac_update_R__ver_crypto_hmac_update not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol crypto_register_alg_R__ver_crypto_register_alg not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol crypto_unregister_alg_R__ver_crypto_unregister_alg not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ec_read_R__ver_ec_read not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ec_write_R__ver_ec_write not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_add_generic_settings_R__ver_ide_add_generic_settings not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_build_dmatable_R__ver_ide_build_dmatable not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_destroy_dmatable_R__ver_ide_destroy_dmatable not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_dma_intr_R__ver_ide_dma_intr not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_get_best_pio_mode_R__ver_ide_get_best_pio_mode not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_pci_register_driver_R__ver_ide_pci_register_driver not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_pci_unregister_driver_R__ver_ide_pci_unregister_driver not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_pio_timings_R__ver_ide_pio_timings not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_set_xfer_rate_R__ver_ide_set_xfer_rate not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_setup_dma_R__ver_ide_setup_dma not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_setup_pci_device_R__ver_ide_setup_pci_device not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol ide_setup_pci_devices_R__ver_ide_setup_pci_devices not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol tty_ldisc_deref_R__ver_tty_ldisc_deref not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol tty_ldisc_get_R__ver_tty_ldisc_get not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol tty_ldisc_put_R__ver_tty_ldisc_put not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol tty_ldisc_ref_R__ver_tty_ldisc_ref not found in System.map.  Ignoring ksyms_base entry
Warning (compare_maps): ksyms_base symbol tty_ldisc_ref_wait_R__ver_tty_ldisc_ref_wait not found in System.map.  Ignoring ksyms_base entry
kernel BUG at prints.c:341!
invalid operand: 0000
CPU:    0
EIP:    0010:[<c0196e04>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010286
eax: 00000042   ebx: c02dca60   ecx: f472a000   edx: db2e4a80
esi: f1191000   edi: ffffffef   ebp: f472bf0c   esp: f472bcbc
ds: 0018   es: 0018   ss: 0018
Process rsync (pid: 13930, stackpage=f472b000)
Stack: c02deafb c03b0ba0 c03ad8c0 00000831 c02dca60 f472bce8 d989e6c0 f472bdc0
       c018c02d f1191000 c02dca60 d989e750 d989e750 d989e6c0 81b4be10 c44b3740
       f472bddc f472be98 00000000 00000000 00000000 00000000 00000001 00000000
Call Trace:    [<c018c02d>] [<c01a43f6>] [<c01379c9>] [<c01379c9>] [<c01379f0>]
  [<c019be57>] [<c01a4a0e>] [<c01a4f06>] [<c0141947>] [<c01419e9>] [<c0141bac>]
  [<c0106c77>]
Code: 0f 0b 55 01 0e eb 2d c0 68 a0 0b 3b c0 85 f6 74 0f 0f b7 46

>>EIP; c0196e04 <reiserfs_panic+34/70>   <=====
Trace; c018c02d <reiserfs_rename+23d/850>
Trace; c01a43f6 <journal_end+16/20>
Trace; c01379c9 <getblk+19/50>
Trace; c01379c9 <getblk+19/50>
Trace; c01379f0 <getblk+40/50>
Trace; c019be57 <is_tree_node+37/60>
Trace; c01a4a0e <check_journal_end+20e/240>
Trace; c01a4f06 <do_journal_end+b6/af0>
Trace; c0141947 <vfs_rename_other+2a7/310>
Trace; c01419e9 <vfs_rename+39/90>
Trace; c0141bac <sys_rename+16c/200>
Trace; c0106c77 <system_call+33/38>
Code;  c0196e04 <reiserfs_panic+34/70>
00000000 <_EIP>:
Code;  c0196e04 <reiserfs_panic+34/70>   <=====
   0:   0f 0b                     ud2a      <=====
Code;  c0196e06 <reiserfs_panic+36/70>
   2:   55                        push   %ebp
Code;  c0196e07 <reiserfs_panic+37/70>
   3:   01 0e                     add    %ecx,(%esi)
Code;  c0196e09 <reiserfs_panic+39/70>
   5:   eb 2d                     jmp    34 <_EIP+0x34> c0196e38 <reiserfs_panic+68/70>
Code;  c0196e0b <reiserfs_panic+3b/70>
   7:   c0 68 a0 0b               shrb   $0xb,0xffffffa0(%eax)
Code;  c0196e0f <reiserfs_panic+3f/70>
   b:   3b c0                     cmp    %eax,%eax
Code;  c0196e11 <reiserfs_panic+41/70>
   d:   85 f6                     test   %esi,%esi
Code;  c0196e13 <reiserfs_panic+43/70>
   f:   74 0f                     je     20 <_EIP+0x20> c0196e24 <reiserfs_panic+54/70>
Code;  c0196e15 <reiserfs_panic+45/70>
  11:   0f b7 46 00               movzwl 0x0(%esi),%eax


97 warnings issued.  Results may not be reliable.

--Nq2Wo0NMKNjxTN9z--

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFCUrSlL9Y7EKZGdD0RAuvYAKDJZL19+xRBx2DhSkBZAcJ4jdmcFQCfbAdX
XQte75MfjDNHCFu6j5t6cv4=
=EYGi
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--
