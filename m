From: Szabolcs Illes <S.Illes@westminster.ac.uk>
Subject: umount after usb hdd power failure
Date: Wed, 11 May 2005 23:41:06 +0000
Message-ID: <42829812.8070402@westminster.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24042-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I have an interesting issue:

I accidentally switch off my usb hard drive without umounting it, then
when I tried to umount the partition:

reiser4[umount(8966)]: reiser4_handle_error
(fs/reiser4/vfs_ops.c:1319)[foobar-42]:
reiser4 panicked cowardly: Filesystem error occured

------------[ cut here ]------------
kernel BUG at fs/reiser4/debug.c:141!
invalid operand: 0000 [#1]
PREEMPT
Modules linked in: michael_mic arc4 ieee80211_crypt_tkip crc32
snd_pcm_oss snd_mixer_oss vmnet vmmon yenta_socket rsrc_nonstatic
pcmcia_core bcm4400 usbmouse usb_storage usbhid snd_intel8x0
snd_ac97_codec snd_pcm snd_timer snd soundcore snd_page_alloc ehci_hcd
uhci_hcd usbcore ipw2200 firmware_class ieee80211 ieee80211_crypt i8k nvidia
CPU:    0
EIP:    0060:[<c01b5fad>]    Tainted: P      VLI
EFLAGS: 00210246   (2.6.11.7-grsec)
eax: 00000000   ebx: c61ec000   ecx: 00000001   edx: c0374b0c
esi: c61ec000   edi: 00000000   ebp: 00000003   esp: c61edc88
ds: 007b   es: 007b   ss: 0068
Process umount (pid: 8966, threadinfo=c61ec000 task=df78b570)
Stack: c0347090 c03d4560 c0345351 c61edca4 00000001 c01d71ec c0345337
00000001
       c034532d c033841d c034506e 00000527 ca632480 c01d14f2 ca632480
c61edce4
       cc552e80 c61edce4 c61ec000 da7ab200 c01d1543 cc552e80 c61edce4
00000003
Call Trace:
 [<c01d71ec>]
 [<c01d14f2>]
 [<c01d1543>]
 [<c01ccba2>]
 [<c01c482c>]
 [<c01c51b4>]
 [<c01c52c5>]
 [<c01c3f2c>]
 [<c01c3f40>]
 [<c01c3f6a>]
 [<c01c495f>]
 [<c01c4a82>]
 [<c0202947>]
 [<c01d0b48>]
 [<c01d6f16>]
 [<c018014d>]
 [<c0180cee>]
 [<c017ff1b>]
 [<c01985e3>]
 [<c0198665>]
 [<c0125727>]
Code: fe ff ff 8d 42 70 e8 bf 8d 17 00 e9 77 ff ff ff 8d 42 70 e8 b2 8d
17 00 eb cc 90 90 90 90 53 83 ec 10 a1 40 45 3d c0 85 c0 74 23 <0f> 0b
8d 00 92 49 34 c0 c7 04 24 bc 4e 35 c0 b8 60 45 3d c0 89
 <6>note: umount[8966] exited with preempt_count 1

Is it possible to handle better this error? because had to restart my
masine.

Szabolcs
