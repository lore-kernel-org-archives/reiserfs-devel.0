From: "Thomas Raschbacher" <lordvan@lordvan.com>
Subject: Re: Reiserfsck can't fix FS - part 2
Date: Fri, 16 Dec 2005 15:14:47 -0000 (GMT)
Message-ID: <10157.195.137.105.19.1134746087.squirrel@195.137.105.19>
References: <1129303303.3370.4.camel@desktop>       
    <200510142008.42253.vitaly@namesys.com>       
    <1129484435.16949.1.camel@desktop>       
    <b14e81f00510171234l4addda48kf73e962b384be6e6@mail.gmail.com>       
    <53246.213.249.155.242.1129721262.squirrel@213.249.155.242>       
    <b14e81f00510201255x3ee436afveb8222f43f69f8a@mail.gmail.com>       
    <10442.195.137.105.19.1134285670.squirrel@195.137.105.19>       
    <f18a8d980512121022j614f431dv62adbbc3caf5a6eb@mail.gmail.com>       
    <b14e81f00512121415j3c415d45q5cdbeadd149d2eab@mail.gmail.com>      
    <f18a8d980512121454q5170cc19i31c9aa3d653226fe@mail.gmail.com>   
    <46071.213.249.155.231.1134648585.squirrel@213.249.155.231>   
    <43A170D7.1070705@namesys.com>
    <10772.195.137.105.19.1134678241.squirrel@195.137.105.19>
    <43A27033.1060109@namesys.com>
Reply-To: lordvan@lordvan.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-27358-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43A27033.1060109@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

done.
error looks pretty much the same to me:

ReiserFS: loop2: found reiserfs format "3.6" with standard journal
ReiserFS: loop2: using ordered data mode
ReiserFS: loop2: journal params: device loop2, size 8192, journal first
block 18, max trans len 1024, max batch 900, max commit age 30, max trans
age 30
ReiserFS: loop2: checking transaction log (loop2)
ReiserFS: loop2: Using r5 hash to sort names
ReiserFS: loop2: Removing [119485 119486 0x0 SD]..<1>Unable to handle
kernel NULL pointer dereference at virtual address 00000000
 printing eip:
00000000
*pde = 00000000
Oops: 0000 [#3]
PREEMPT
Modules linked in: smbfs isofs zlib_inflate loop nvidia eeprom asb100
i2c_sensor i2c_viapro lp snd_seq_midi snd_emu10k1_synth snd_emux_synth
snd_seq_virmidi snd_seq_midi_emul snd_pcm_oss snd_mixer_oss snd_seq_dummy
snd_seq_oss snd_seq_midi_event snd_seq ohci_hcd parport_pc parport pcspkr
via_ircc irda crc_ccitt ehci_hcd emu10k1_gp gameport snd_emu10k1
snd_rawmidi snd_seq_device snd_ac97_codec snd_pcm snd_timer snd_page_alloc
snd_util_mem snd_hwdep snd zr36060 adv7175 eth1394 saa7110 zr36067
i2c_algo_bit videocodec b44 ohci1394 ieee1394 via_agp evdev dvb_ttpci
l64781 saa7146_vv video_buf saa7146 v4l1_compat v4l2_common videodev
ves1820 tda8083 stv0297 sp8870 firmware_class ves1x93 ttpci_eeprom stv0299
i2c_core dvb_core usb_storage usblp uhci_hcd 8139too sg sr_mod
CPU:    0
EIP:    0060:[<00000000>]    Tainted: P      VLI
EFLAGS: 00010286   (2.6.12-gentoo-r6)
EIP is at stext+0x3feffdd8/0x8
eax: c0403bc0   ebx: fffffff4   ecx: dd719190   edx: 00000001
esi: d9dd56b8   edi: e7c9a4b4   ebp: 00000000   esp: eadacbd4
ds: 007b   es: 007b   ss: 0068
Process mount (pid: 13599, threadinfo=eadac000 task=d31fb0e0)
Stack: c0172057 d9dd56b8 e7c9a4b4 00000000 ffffffff c03b4071 dc38d979
ceb3c400
       c01720af eadacc10 dd719164 00000000 c017212b eadacc10 dd719164
dc38d979
       00000006 c03b406b efe27080 dd719164 00000000 c03b4072 c01d7026
c03b406b
Call Trace:
 [<c0172057>] __lookup_hash+0xa7/0xe0
 [<c01720af>] lookup_hash+0x1f/0x30
 [<c017212b>] lookup_one_len+0x6b/0x80
 [<c01d7026>] __get_xa_root+0x66/0xf0
 [<c01d722b>] open_xa_dir+0x17b/0x1b0
 [<c039b8b2>] preempt_schedule+0x42/0x60
 [<c011970a>] release_console_sem+0xea/0x100
 [<c01d835d>] reiserfs_delete_xattrs+0x8d/0x240
 [<c01b1c60>] reiserfs_delete_inode+0x0/0x130
 [<c01b1cc9>] reiserfs_delete_inode+0x69/0x130
 [<c0222917>] vsprintf+0x27/0x30
 [<c01c351d>] prepare_error_buf+0xed/0x1c0
 [<c01b1c60>] reiserfs_delete_inode+0x0/0x130
 [<c017f885>] generic_delete_inode+0xc5/0x1b0
 [<c017fb3c>] iput+0x3c/0x90
 [<c01bf45f>] finish_unfinished+0x28f/0x4a0
 [<c01c1e6a>] reiserfs_fill_super+0x6fa/0x7a0
 [<c01b4960>] reiserfs_init_locked_inode+0x0/0x20
 [<c01695fe>] sb_set_blocksize+0x2e/0x60
 [<c0168eb8>] get_sb_bdev+0xf8/0x170
 [<c01c298f>] get_super_block+0x2f/0x33
 [<c01c1770>] reiserfs_fill_super+0x0/0x7a0
 [<c01691ae>] do_kern_mount+0xae/0x190
 [<c0182ba3>] do_new_mount+0x83/0xe0
 [<c01833be>] do_mount+0x1ee/0x200
 [<c0183170>] copy_mount_options+0x60/0xc0
 [<c039c9ee>] lock_kernel+0x2e/0x50
 [<c01837cf>] sys_mount+0x9f/0xe0
 [<c01033db>] sysenter_past_esp+0x54/0x75
Code:  Bad EIP value.

-- 
-----BEGIN GEEK CODE BLOCK-----
GCS/CC/E/M/MU/S d- s: a--- C++++(++) UL++++ P+ L++++ E W+++ N+++ o-- K w-- O
M-- V- PS+ PE-- Y++ PGP+++ t+++ 5+ X- R tv b++++ DI- D+ G++ e-->+++++ h-- !r
z-
------END GEEK CODE BLOCK------

On Fri, December 16, 2005 7:43, Vladimir V. Saveliev said:
> Hello
>
> Thomas Raschbacher wrote:
>> reiserfsck didn't give me any errors:
>>
>> desktop Storage3 # reiserfsck usb-reiser3.img
>> reiserfsck 3.6.19 (2003 www.namesys.com)
>>
>> *************************************************************
>> ** If you are using the latest reiserfsprogs and  it fails **
>> ** please  email bug reports to reiserfs-list@namesys.com, **
>> ** providing  as  much  information  as  possible --  your **
>> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
>> ** messages  (including version),  the reiserfsck logfile, **
>> ** check  the  syslog file  for  any  related information. **
>> ** If you would like advice on using this program, support **
>> ** is available  for $25 at  www.namesys.com/support.html. **
>> *************************************************************
>>
>> Will read-only check consistency of the filesystem on usb-reiser3.img
>> Will put log info to 'stdout'
>>
>> Do you want to run this program?[N/Yes] (note need to type Yes if you
>> do):Yes
>> ###########
>> reiserfsck --check started at Thu Dec 15 18:08:00 2005
>> ###########
>> Replaying journal..
>> Reiserfs journal 'usb-reiser3.img' in blocks [18..8211]: 0 transactions
>> replayed
>> Checking internal tree..finished
>> Comparing bitmaps..finished
>> Checking Semantic tree:
>> finished
>> No corruptions found
>> There are on the filesystem:
>>         Leaves 47328
>>         Internal nodes 321
>>         Directories 52464
>>         Other files 215525
>>         Data block pointers 11832978 (1842 of them are zero)
>>         Safe links 2
>> ###########
>> reiserfsck finished at Thu Dec 15 18:16:33 2005
>> ###########
>>
>> The only tainted kernel module i'm using is the nvidia driver.
>> and i'm using many other reiserfs filesystems on my machine root, and ~
>> 5
>> other partitions.
>>
>> any idea?
>>
>
> Would you, please, try to mount this filesystem with -o nouser_xattr?
>
>


