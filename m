From: "John P. New" <jnew@hazelden.ca>
Subject: Re: Procedure to recover a bad superblock
Date: 18 Aug 2003 10:22:47 -0400
Message-ID: <1061216567.3562.50.camel@headoffice.hazelden.ca>
References: <1061131936.3001.8.camel@headoffice.hazelden.ca>
	 <20030818061941.GC16183@namesys.com>
	 <1061207028.3736.17.camel@headoffice.hazelden.ca>
	 <20030818133329.GD10536@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15364-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030818133329.GD10536@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Oleg,

I ran reiserfsck --rebuild-sb /dev/md1 and got (edited):

reiserfsck, 2003 - reiserfsprogs 3.6.8  

Will check superblock and rebuild it if needed
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes

reiserfs_open: the reiserfs superblock cannot be found on /dev/md1.

what is version of ReiserFS you use[1-4]
        (1)   3.6.x
        (2) >=3.5.9 (introduced in the middle of 1999) (if you use linux
2.2, choose this one)
        (3) < 3.5.9 converted to new format (don't choose if unsure)
        (4) < 3.5.9 (this is very old format, don't choose if unsure)
        (X)   exit
1

Enter block size [4096]:
4096

No journal device was specified. (If journal is not available, re-run
with --no-journal-available).
Is journal standard? (y/n)[y]: y

Did you use resiser(y/n)[n]: n
rebuild-sb: no uuid found, a new uuid generated
(5f705731-5fa9-4c16-b5fe-2b0a64ea6a60)
Reiserfs super block in block 16 on 0x901 of format 3.6 with standard
journal
Count of blocks on the device: 14861888
Number of bitmaps: 454
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 0
Root block: 0
Filesystem is NOT cleanly umounted
Tree height: 0
Hash function used to sort names: not set
Objectid map size 0, max 972
Journal parameters:
        Device [0x0]
        Magic [0x0]
        Size 8193 blocks (including 1 for journal header) (first block
18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x1:
         some corruptions exist.
sb_version: 2
inode generation number: 0
UUID: 5f705731-5fa9-4c16-b5fe-2b0a64ea6a60
LABEL:
Set flags in SB:
Is this ok ? (y/n)[n]: y
The fs may still be unconsistent. Run reiserfsck --check.



And then I ran reiserfsck --check --logfile /root/rfscheck.log /dev/md1
and got (edited):

reiserfsck, 2003 - reiserfsprogs 3.6.8  
Will read-only check consistency of the filesystem on /dev/md1
Will put log info to '/root/rfscheck.log'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
###########
reiserfsck --check started at Mon Aug 18 09:59:43 2003
###########
Replaying journal..
0 transactions replayed
Checking internal tree..

Bad root block 0. (--rebuild-tree did not complete)

Aborted (core dumped)



Now what? Is it time for a --rebuild-tree, or are we past that because
of the 'Bad root block 0. (--rebuild-tree did not complete)' error?

John



On Mon, 2003-08-18 at 09:33, Oleg Drokin wrote:
> Hello!
> 
> On Mon, Aug 18, 2003 at 07:43:48AM -0400, John P. New wrote:
> 
> > As for what ide devices I have below the softraid, I'm not sure what you
> > mean. I have a CD/RW on hda and a Colorado Travan tape drive on hdb, and
> 
> I mean on what devices do you build your softraid.
> 
> > I ran reiserfsck --rebuild-sb /dev/md1, and it asked me what block size
> > to use. I looked at /var/log/messages, and the first boot after the
> > power outage log reads:
> 
> blocksize is always 4k
> 
> > In other words, different block sizes. for the same device. Should I be
> > concerned, and what value should I use for reiserfsck?
> 
> Sure.
> Always givre 4k for now.
> 
> Bye,
>     Oleg

