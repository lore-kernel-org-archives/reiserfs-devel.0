From: grossnik.mailinglists@hispeed.ch
Subject: Re: Re: reiserfsck (3.6.19) --rebuild-tree failed
Date: Fri, 8 Sep 2006 16:42:42 +0200
Message-ID: <200609081442.k88Eggwv029431@smtp.hispeed.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29837-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
Sender: Grossniklaus Mailinglists <grossnik.mailinglists@hispeed.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vs@namesys.com
Cc: reiserfs-list@namesys.com

Hi Vladimir
>please run=20
>reiserfsck (3.6.19.3) --rebuild-tree --badblocks /root/hda3.bad /dev/hda3=
=20
>once again and let me see whole output of the command.


I'm 100% happy. Now it did not stop.
Either it would haven been nessesary to run it twice or the new version I'v=
e got from did the trick.

I thank you so much!
Now I go any buy a new disk!!!

Here's the output (I deleted not usefull text and marked it with ...)

reiserfsck 3.6.19.3 (2003 www.namesys.com)

*************************************************************
** Do not  run  the  program  with  --rebuild-tree  unless **
** something is broken and MAKE A BACKUP  before using it. **
** If you have bad sectors on a drive  it is usually a bad **
** idea to continue using it. Then you probably should get **
** a working hard drive, copy the file system from the bad **
** drive  to the good one -- dd_rescue is  a good tool for **
** that -- and only then run this program.                 **
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will rebuild the filesystem (/dev/hda3) tree
Bad block list will contain only blocks specified in '/root/hda3.bad' file
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):R=
eplaying journal..
Reiserfs journal '/dev/hda3' in blocks [18..8211]: 0 transactions replayed
###########
reiserfsck --rebuild-tree started at Fri Sep  8 15:33:05 2006
###########

Pass 0:
Loading on-disk bitmap .. ok, 992967 blocks marked used
Skipping 8360 blocks (super block, journal, bitmaps) 984586 blocks will be =
read
0%                                                          left 984585, 0 =
/sec

...

left 26944, 5503 /sec                        left 21343, 5504 /sec
io.c: bread: 471: Cannot read the block (4602192): (Input/output error).
do_pass_0: Reading of the block 4602192 failed
                        left 21321, 4965 /sec
io.c: bread: 471: Cannot read the block (4602200): (Input/output error).
do_pass_0: Reading of the block 4602200 failed
                        left 18822, 4952 /sec                        left 1=
5824, 4942 /sec                        left 12987, 4931 /sec               =
          left 9920, 4922 /sec                         left 6805, 4913 /sec=
                         left 1611, 4914 /sec100%                        le=
ft 0, 4922 /sec
	"r5" hash is selected
Flushing..finished
	Read blocks (but not data blocks) 984584
		Leaves among those 20634
		Objectids found 90556

Pass 1 (will try to insert 20634 leaves):
Looking for allocable blocks .. finished
0%                                                           left 20633, 0 =
/sec

...

 left 6518, 1411 /sec..80%                             left 4074, 1505 /sec=
....100%                        left 0, 1875 /sec
Flushing..finished
	20634 leaves read
		20467 inserted
		167 not inserted

Pass 2:
0%                                                             left 333, 0 =
/sec                                                             left 332, =
0 /sec                                                             left 331=
, 0 /sec
...

 left 0, 0 /sec
Flushing..finished
	Leaves inserted item by item 167
Pass 3 (semantic):
####### Pass 0 #######
90547 directory entries were hashed with "r5" hash.
####### Pass 1 #######
####### Pass 2 #######
####### Pass 3 #########
/..    /grossnik/..
...
/.saves-14890-kim.voyager.space.xx~ /.saves-6417-kim.localdomain~          =
                                                      /lost+found/..       =
         Flushing..finished
	Files found: 80711
	Directories found: 8677
	Symlinks found: 1153
	Others: 4
Pass 3a (looking for lost dir/files):
Looking for lost directories:
               done 0, 0 /sec               done 1, 0 /sec          done 94=
83, 225 /secFlushing..finished
Pass 4 -                done 0, 0 /sec
finished
Flushing..finished
Syncing..finished
###########
reiserfsck finished at Fri Sep  8 15:37:33 2006
###########
####### Pass 3a (lost+found pass) #########

