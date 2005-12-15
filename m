From: "Thomas Raschbacher" <lordvan@lordvan.com>
Subject: Re: Reiserfsck can't fix FS - part 2
Date: Thu, 15 Dec 2005 12:09:45 -0000 (GMT)
Message-ID: <46071.213.249.155.231.1134648585.squirrel@213.249.155.231>
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
Reply-To: lordvan@lordvan.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-27310-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <f18a8d980512121454q5170cc19i31c9aa3d653226fe@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I just tried to mount my reiserfs (which i fixed) as loopback (it worked
before ..)

but this time i got this error (and a segfault):

any ideas what the problem is?
shall i run --fix-fixable?


loop: loaded (max 8 devices)
ReiserFS: loop0: found reiserfs format "3.6" with standard journal
ReiserFS: loop0: using ordered data mode
ReiserFS: loop0: journal params: device loop0, size 8192, journal first
block 18, max trans len 1024, max batch 900, max commit age 30, max trans
age 30
ReiserFS: loop0: checking transaction log (loop0)
ReiserFS: loop0: replayed 3 transactions in 0 seconds
ReiserFS: loop0: Using r5 hash to sort names
ReiserFS: loop0: Removing [119485 119486 0x0 SD]..<1>Unable to handle
kernel NULL pointer dereference at virtual address 00000000
 printing eip:
00000000
*pde = 00000000
Oops: 0000 [#1]
PREEMPT
Modules linked in: loop nvidia eeprom asb100 i2c_sensor i2c_viapro lp
snd_seq_midi snd_emu10k1_synth snd_emux_synth snd_seq_virmidi
snd_seq_midi_emul snd_pcm_oss snd_mixer_oss snd_seq_dummy snd_seq_oss
snd_seq_midi_event snd_seq ohci_hcd parport_pc parport pcspkr via_ircc
irda crc_ccitt ehci_hcd emu10k1_gp gameport snd_emu10k1 snd_rawmidi
snd_seq_device snd_ac97_codec snd_pcm snd_timer snd_page_alloc
snd_util_mem snd_hwdep snd zr36060 adv7175 eth1394 saa7110 zr36067
i2c_algo_bit videocodec b44 ohci1394 ieee1394 via_agp evdev dvb_ttpci
l64781 saa7146_vv video_buf saa7146 v4l1_compat v4l2_common videodev
ves1820 tda8083 stv0297 sp8870 firmware_class ves1x93 ttpci_eeprom stv0299
i2c_core dvb_core usb_storage usblp uhci_hcd 8139too sg sr_mod
CPU:    0
EIP:    0060:[<00000000>]    Tainted: P      VLI
EFLAGS: 00010282   (2.6.12-gentoo-r6)
EIP is at stext+0x3feffdd8/0x8
eax: c0403bc0   ebx: fffffff4   ecx: cd90a7f0   edx: 00000001
esi: d0a50398   edi: d63725c4   ebp: 00000000   esp: c32b4bd4
ds: 007b   es: 007b   ss: 0068
Process mount (pid: 25469, threadinfo=c32b4000 task=c20c45c0)
Stack: c0172057 d0a50398 d63725c4 00000000 ffffffff c03b4071 dc38d979
e06c2c00
       c01720af c32b4c10 cd90a7c4 00000000 c017212b c32b4c10 cd90a7c4
dc38d979
       00000006 c03b406b efe27080 cd90a7c4 00000000 c03b4072 c01d7026
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

On Mon, December 12, 2005 22:54, Bedros Hanounik said:
>>IIRC, --rebuild-tree is known to bring back things from the dead.
>>When you reformatted the HD, did you zero it out first?  If not, then
>>any future rebuild-tree might screw things up again.  Just something
>>to consider.
>
> I did "dd if=/dev/urandom of=/dev/sda" over night which should have
> overwritten all the old stuff before formatting the HD.
>
>>IIRC this is an internal thing - it doesn't mean there are errors on
>>it per se, it just means that you didn't shut down properly at least
>>once and the machine didn't mark the fileystem as clean
>
> it repeated the same message even after clean shut down and after
> reiserfsck.
>
> reiserfs in general is trouble free FS, and after couple years of using
> it,
> this is the first time I have issues with it.
>
>
> -B
>
>
> On 12/12/05, michael chang <thenewme91@gmail.com> wrote:
>>
>> On 12/12/05, Bedros Hanounik <2bedros@gmail.com> wrote:
>> > I had the exact same problem on a 300GB hard drive over USB with
>> ReiserFS
>>
>> USB isn't the same as other hard drive interfaces... maybe there's
>> something not acting nice.  IIRC, USB took longer than ATA/IDE and
>> SCSI to get reasonable bus speeds, and nowadays venders are still
>> pretty cheap when it comes to USB performance (maybe enough power to
>> use a mouse and keyboard, but rarely enough for any serious work on
>> anything larger than a 512 USB stick)
>>
>> > by running resiserfsck, the tools suggested running it again with
>> > --rebuild-tree option and it was a mistake.
>> >
>> > reiserfsck --rebuild-tree screwed things  up big time; but I had a
>> backup
>> > copy of my stuff, so I reformatted the HD.
>>
>> IIRC, --rebuild-tree is known to bring back things from the dead.
>> When you reformatted the HD, did you zero it out first?  If not, then
>> any future rebuild-tree might screw things up again.  Just something
>> to consider.
>>
>> > I would probably never use the option --rebuild-tree, only
>> --fix-fixable.
>>
>> Yeah, probably a good idea... although if your reiserfs is in a state
>> where it's telling you to --rebuild-tree, it's time to dump it to
>> another disk or to CD-RWs or DVD or something and reformat, zero out,
>> and restore.
>>
>> > I'm not sure if the partition actually was corrupted. I was able to
>> access
>> > it, but on start when mounting the partition it gave me error
>> messages;
>> > something like "file system not clean"
>>
>> IIRC this is an internal thing - it doesn't mean there are errors on
>> it per se, it just means that you didn't shut down properly at least
>> once and the machine didn't mark the fileystem as clean - there may or
>> may not be an incomplete write => error on your disk.  So long as you
>> don't get any major errors, you should be okay.
>>
>> >
>> > On 12/10/05, Thomas Raschbacher <lordvan@lordvan.com> wrote:
>> > > Hi,
>> > >
>> > > Finally got my new HDD (300 GB UDMA133 :D no usb anymore ..)
>> > > i backed up my data and ran reiserfsck on one of the other
>> partitions
>> > > which were supposedly damaged.
>> > > it didn't work out (stopped at same point always)
>> > >
>> > > then i made a backup copy of my backup copy and ran reiserfsck on
>> that
>> and
>> > > it worked just fine.
>> > >
>> > > -> it seems that my filesystems never had errors in the first place
>> but
>> > > running reiserfsck on my USB hdd caused the problems in the first
>> place.
>> > > fortunately i could recover all my digital camera photos (which i
>> will
>> > > definitely back up on DVD from now on!
>> > > some mp3's lost the filenames but who really cares about that
>> anyway.
>> > >
>> > > i suggest adding to the reiserfsck docs that running it on usb-hdds
>> might
>> > > cause problems due to usb hdd driver bugs or whatever .. or at least
>> a
>> > > note that if it fails on usb-hdd copy it to a non usb hdd and try
>> again.
>> > >
>> > > Regards,
>> > >   Thomas R
>> > > P.S.: I never enforced bandwidth allocation. but i still dont' know
>> what
>> > > the problem is with this stupid USB2 storage stuffs .. it worked
>> fine
>> with
>> > > some old kernel (either early 2.6 or still 2.4 ..) any ideas what
>> can
>> > > cause this kind of problems with usb hdds? or should i post to some
>> kernel
>> > > mailing list/newsgroup?
>> > >
>> > >
>> > > --
>> > > -----BEGIN GEEK CODE BLOCK-----
>> > > GCS/CC/E/M/MU/S d- s: a--- C++++(++) UL++++ P+ L++++ E W+++ N+++ o--
>> K
>> w--
>> > O
>> > > M-- V- PS+ PE-- Y++ PGP+++ t+++ 5+ X- R tv b++++ DI- D+ G++
>> e-->+++++
>> h--
>> > !r
>> > > z-
>> > > ------END GEEK CODE BLOCK------
>> > >
>> > > On Thu, October 20, 2005 19:55, michael chang said:
>> > > > On 10/19/05, Thomas Raschbacher <lordvan@lordvan.com> wrote:
>> > > >> Actually I did send it SIGUSR1 signals to get the progress so it
>> really
>> > > >> seems to work fine.
>> > > >> I intend to get another HDD (internal) and see if i can copy the
>> FS
>> and
>> > > >> then fix it there.
>> > > >> how would I best copy the filesystem? DD ?
>> > > >> (The PRoblems I had before with this disc are USB-storage related
>> where
>> > > >> the disc does stop working if one reads/writes too much data at
>> once on
>> > > >> USB2)
>> > > >
>> > > > The USB2 data loss thing sounds like a bandwidth-allocation
>> problem;
>> > > > since it's not always advisible to enforce it by default (well, I
>> > > > don't know about that, but I don't enforce it in any of my
>> hand-built
>> > > > kernels).  What you are doing next sounds reasonable, please
>> inform
>> us
>> > > > how well it goes.
>> > > >
>> > > > --
>> > > > ~Mike
>> > > >  - Just my two cents
>> > > >  - No man is an island, and no man is unable.
>> > > >
>> > >
>> > >
>> > >
>> >
>> >
>>
>>
>> --
>> ~Mike
>> - Just the crazy copy cat.
>>
>


