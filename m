From: Maximilian Mehnert <widolo87@yahoo.de>
Subject: kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:80?
Date: Sun, 21 May 2006 12:39:05 +0200
Message-ID: <44704349.70602@yahoo.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040705070600030208090908"
Return-path: <reiserfs-list-return-28656-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------040705070600030208090908
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Kernel-Patch: reiser4-for-2.6.16-2.patch.gz

kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:80!
invalid opcode: 0000 [#1]
[...]



I thought that maybe someone with greater insight than I might be
interested in the attached kernel dump.
I don't know how to reproduce this - the only thing I can say is, that I
had several reiser4 partitions under heavy load. (Now I changed to
reiserfs... Too many problems with reiser4 during the last days.. :-( )

I noticed another thing: using reiser4 for some days on my laptop rendered
kopete (instant messaging application) nearly unresponsive. Looking at the
output of strace it seems that the frequent use of fsync()  (in sqlite)
causes heavy i/o with reiser4. This problem does not occur with ext3 or
reiserfs...

Best regards,

Maximilian Mehnert


--------------040705070600030208090908
Content-Type: text/plain;
 name="error.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="error.txt"

------------[ cut here ]------------
kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:80!
invalid opcode: 0000 [#1]
Modules linked in: loop vfat fat reiserfs sd_mod usb_storage scsi_mod nbd iptable_mangle iptable_nat ip_nat vmnet vmmon nfnetlink_queue nfnetlink xt_tcpudp iptable_filter ip_tables nfsd exportfs lockd sunrpc xt_NFQUEUE xt_state x_tables ipv6 arc4 ppp_mppe ppp_generic slhc eeprom button ac thermal fan battery i915 drm cpufreq_ondemand speedstep_centrino processor usbhid ipw2200 snd_hda_intel snd_hda_codec snd_pcm_oss snd_mixer_oss ieee80211 snd_pcm ieee80211_crypt snd_timer snd snd_page_alloc ehci_hcd uhci_hcd i2c_i801 usbcore ohci1394 ieee1394
CPU:    0
EIP:    0060:[<c0190d8c>]    Tainted: P      VLI
EFLAGS: 00210282   (2.6.16-4gb #2) 
EIP is at get_nonexclusive_access+0x23/0x36
eax: e8786544   ebx: 00000000   ecx: b79f5810   edx: f7a39c94
esi: f7a39c94   edi: 00000000   ebp: f7a39cec   esp: d32b1dec
ds: 007b   es: 007b   ss: 0068
Process slapcat (pid: 346, threadinfo=d32b0000 task=c79a6580)
Stack: <0>c01a3579 f7a39c94 00000000 00000001 00000000 00095c41 00000000 f7d2bc14 
       00001000 00000000 c84fee00 00001000 ca497550 00000000 ca497550 c01a0e94 
       ca497550 00000000 ca497550 446e481d 31d2c036 00000000 00000000 ca497568 
Call Trace:
 [<c01a3579>] write_extent+0x612/0xb59
 [<c01a0e94>] unit_key_extent+0x24/0x38
 [<c01a21f5>] init_coord_extension_extent+0xa7/0xe8
 [<c01a2f67>] write_extent+0x0/0xb59
 [<c018f994>] write_flow+0x247/0x2e1
 [<c0190239>] write_unix_file+0x355/0x4e5
 [<c0146074>] vfs_write+0xa3/0x13a
 [<c014614c>] sys_pwrite64+0x41/0x59
 [<c010295d>] syscall_call+0x7/0xb
Code: 00 89 e8 5b 5e 5f 5d c3 83 7c 24 08 00 8b 54 24 04 75 20 b8 00 e0 ff ff 21 e0 8b 00 8b 80 c4 04 00 00 8b 40 40 83 78 08 00 74 08 <0f> 0b 50 00 ed 96 31 c0 89 d0 ff 00 0f 88 f4 06 00 00 c3 55 57 
 <4><4>reiser4[slapcat(346)]: release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
WARNING: out of memory?
<4>reiser4[slapcat(346)]: release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
WARNING: out of memory?


--------------040705070600030208090908--

	

	
		
___________________________________________________________ 
Telefonate ohne weitere Kosten vom PC zum PC: http://messenger.yahoo.de

