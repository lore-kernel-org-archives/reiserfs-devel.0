From: "Brian Chu" <chub@stuy.yi.org>
Subject: reiserfsck --rebuild-tree all-in-one problem.
Date: Sun, 2 Feb 2003 13:33:17 -0500
Message-ID: <063201c2cae9$8dfb69d0$0201010a@brian>
Reply-To: "Brian Chu" <chub@dataroot.hn.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12604-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello.

    Last friday when I went to upgrade my server, I noticed that there had
been a lot of kernel messages on my server that were saying that one
partition was spewing this:

Jan  5 13:48:14 simmy kernel: hde: dma_intr: status=0x51 { DriveReady
SeekComplete Error }
Jan  5 13:48:14 simmy kernel: hde: dma_intr: error=0x40 {
UncorrectableError }, LBAsect=91887, high=0, low=91887, sector=91824
Jan  5 13:48:14 simmy kernel: end_request: I/O error, dev 21:01 (hde),
sector 91824
Jan  5 13:48:14 simmy kernel: vs-13070: reiserfs_read_inode2: i/o failure
occurred trying to find stat data of [7495 7710 0x0 SD]

    I checked it for this email just now and discovered that this problem
has been persisting for at least one month (logrotate deleted the rest),
which is surprising because I never had any problems with the hard drive for
all this time.

    Either way, after I was done upgrading my server, I figured I could run
reiserfsck since it was a new reboot with 'reiserfsck --check /dev/hde1'
(version 3.6.3) which proved to be fatal. After the first fsck, reiserfsck
did not exit cleanly (I don't remember the error, this was two days ago),
and I was able to mount back the partition, so I unmounted and fsck again,
and again it did not exit cleanly. This time, however, I could not mount it,
with mount giving "mount: Not a directory" error and exiting, even though
reiserfs did the journal replay and all. I restarted it, but it was not
mounted, and so I took the hard drive out. It was here that I noticed that
the errors were probably because bad sectors had developed on the drive, so
since I had an identical (160GB Maxtor 4G160J8) drive, I brought it to a
spare comp, installed debian (testing) onto it, and put in the hard drives.
(reiserfsck version 3.6.4)

    From there, I ran a dd to copy the data from the damaged drive to the
new unused drive, and I started running reiserfsck --check. --check told me
I had to run --rebuild-tree, so I ran --rebuild-tree with the logfile.

    I ran this process for two times now, and each time --rebuild-tree would
stop at the second Pass with the leaf insertion. The first time, the log
file had taken up all the space in the root partition of the machine, so I
figured that it was because the log file took up all the space (this was a
1.7GB file I had. *twice*), that caused reiserfsck to stop.

    I gave up that night, because running dd once took 7 hours and
reiserfsck twice took 2 hours each, so the whole day was wasted.  I had read
on the first time I ran --rebuild-tree that a "dd_rescue" was suggested, so
I downloaded it, installed it, and ran it again (since I had used just plain
dd the first time). I'm not sure if that made a difference or not.

    Today I started again, assuming that with dd_rescue, I would have a
greater chance of getting the filesystem recovered, but --check told me I
had to run --rebuild-tree, and this time I just did --logfile /dev/null,
because screen dumps during the run would make it impossible to see what's
going on. But again, it stopped again at the same place- Pass 2. Since the
logfiles spit so much STUFF out, I have none at the moment (I can remake
them if needed).

Screen dump:

Pass 0:
Loading on-disk bitmap .. ok, 35629753 blocks marked used
Skipping 9432 blocks (super block, journal, bitmaps) 35620321 blocks will be
rea
d
0%....20%....40%....60%....80%....100%                        left 0, 6936
/sec
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 35620321
                Leaves among those 68299
                        - leaves all contents of which could not be saved
and deleted 1
                Objectids found 152402

Pass 1 (will try to insert 68298 leaves):
Looking for allocable blocks .. fininshed
0%....20%....40%....60%....80%....100%                        left 0, 1219
/sec
Flushing..finished
        68298 leaves read
                68262 inserted
                36 not inserted

Pass 2:
0%....20%....40%..                                              left 36, 0
/sec

    And it stops there. top indicates reiserfsck is using all of the cpu
cycles, even after it seemingly freezes.

    debugreiserfs -p... creates a huge file, so I stopped it.

    The filesytem has about 136GB of data that I would really like to
recover. Of course, because of the 1000/1024 thing, the partition has only
152GB of partition space.

    Throughout the process reiserfsck spit out a lot of problems. Is there a
way I can have reiserfsck skip through passes, because generating what the
pass1 and pass2 messages (which are probably more important) would require
that I wait at least ~two hours to get through pass0.

    mount ... weird. mount gives a different message now. mount was giving
the same "mount: Not a directory" that the first computer had given before
this last run of reiserfsck.

simmy:~# mount -t reiserfs /dev/hdd1 /mnt
Feb  2 13:41:00 simmy kernel: dev 16:41: Unfinished
reiserfsck --rebuild-tree run detected. Please run
Feb  2 13:41:00 simmy kernel: reiserfsck --rebuild-tree and wait for a
completion. If that fails
Feb  2 13:41:00 simmy kernel: get newer reiserfsprogs package
Feb  2 13:41:00 simmy kernel: read_super_block: can't find a reiserfs
filesystem on (dev 16:41, block 2, size 4096)
mount: wrong fs type, bad option, bad superblock on /dev/hdd1,
       or too many mounted file systems

    Any (quick) help will be appreciated. If any information is missing,
please ask.

chub@stuy.yi.org
PS: I'm on the list so I can find the replies there, but cc it to my email
address if possible (list email goes to another one).

