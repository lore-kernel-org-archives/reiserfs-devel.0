From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: resize reiserfs
Date: Thu, 5 Feb 2004 11:49:30 +0300
Message-ID: <20040205084929.GE1733@backtop.namesys.com>
References: <1075919278.1901.14.camel@linux.local> <200402050025.54725.vitaly@namesys.com> <1075936282.18623.29.camel@linux.local>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16706-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1075936282.18623.29.camel@linux.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Farkas Barnab?s <kinca@freemail.hu>
Cc: reiserfs-list@namesys.com, umka@clusterfs.com

On Thu, Feb 05, 2004 at 12:11:22AM +0100, Farkas Barnab?s wrote:
> On Wed, 2004-02-04 at 22:25, Vitaly Fertman wrote:
> > On Wednesday 04 February 2004 21:27, Farkas Barnab?s wrote:
> > > Hello World,
> > 
> > Hello Farkas,
> > 
> > > I would like to resize my reiserfs partition. When its finished, I
> > > couldn't mount the partition. I've got error messages
> > > I tried --rebuild-tree
> > 
> > Did resize_reiserfs finish properly or fail? Could you describe you 
> > steps more precisely? How did you run resizer_reiserfs? What did 
> > you do next? Did you run reiserfsck --rebuild-sb? Etc.
> 
> I made the resizing with QtParted-0.4.1

with reiserfs support through libreiserfs, yes?

> There was no error. but I can't mount again.
> --rebuild-sb
> 
> linux:~ # /usr/local/sbin/reiserfsck --rebuild-sb /dev/hda1
> reiserfsck 3.6.11 (2003 www.namesys.com)
> 
> *************************************************************
> ** If you are using the latest reiserfsprogs and  it fails **
> ** please  email bug reports to reiserfs-list@namesys.com, **
> ** providing  as  much  information  as  possible --  your **
> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> ** messages  (including version),  the reiserfsck logfile, **
> ** check  the  syslog file  for  any  related information. **
> ** If you would like advice on using this program, support **
> ** is available  for $25 at  www.namesys.com/support.html. **
> *************************************************************
> 
> Will check superblock and rebuild it if needed
> Will put log info to 'stdout'
> 
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes
> Reiserfs super block in block 16 on 0x301 of format 3.6 with standard
> journal
> Count of blocks on the device: 7327648
> Number of bitmaps: 224
> Blocksize: 4096
> Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
> blocks): 7327648
> Root block: 0
> Filesystem is cleanly umounted
> Tree height: 0
> Hash function used to sort names: "r5"
> Objectid map size 2, max 972
> Journal parameters:
>         Device [0x0]
>         Magic [0x0]
>         Size 8193 blocks (including 1 for journal header) (first block
> 18)
>         Max transaction length 1024 blocks
>         Max batch size 900 blocks
>         Max commit age 30
> Blocks reserved by journal: 0
> Fs state field: 0x0:
> sb_version: 2
> inode generation number: 0
> UUID: 4e4889c5-8054-4d5a-b050-754856b0d279
> LABEL:
> Set flags in SB:
> 
> Super block seems to be correct
> 
> 
> > > linux:~ # /usr/local/sbin/reiserfsck --rebuild-tree /dev/hda1
> > > reiserfsck 3.6.11 (2003 www.namesys.com)
> > >
> > > reiserfsck --rebuild-tree started at Wed Feb  4 19:20:21 2004
> > > ###########
> > >
> > > Pass 0:
> > > ####### Pass 0 #######
> > > Loading on-disk bitmap .. ok, 8434 blocks marked used
> > > Skipping 8434 blocks (super block, journal, bitmaps) 0 blocks will be
> > > read
> > >
> > > Could not find a hash in use. Using "r5"
> > >         "r5" hash is selected
> > > Flushing..finished
> > >         Read blocks (but not data blocks) 0
> > >                 Leaves among those 0
> > >                 Objectids found 2
> > >
> > > Pass 1 (will try to insert 0 leaves):
> > > ####### Pass 1 #######
> > > Looking for allocable blocks .. finished
> > >
> > > Flushing..finished
> > >         0 leaves read
> > >                 0 inserted
> > > ####### Pass 2 #######
> > > Flushing..finished
> > >
> > >
> > > No reiserfs metadata found.  
> > 
> > > debugreiserfs 3.6.11 (2003 www.namesys.com)
> > >
> > > Count of blocks on the device: 7327648
> > > Free blocks: 7327648
> 
> Thanks
> 
> 

-- 
Alex.
