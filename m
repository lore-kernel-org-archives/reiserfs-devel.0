From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Linux 2.4 -> 2.6 migration
Date: Sat, 8 Nov 2003 14:09:50 +0300
Message-ID: <200311081409.50425.vitaly@namesys.com>
References: <m3ptg42t8l.fsf@toyland.sauerland.de> <20031108101133.GS11516@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16017-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031108101133.GS11516@backtop.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>, Sebastian Kaps <seb-keyword-reiserfs.0462a0@toyland.sauerland.de>
Cc: reiserfs-list@namesys.com

On Saturday 08 November 2003 13:11, Alex Zarochentsev wrote:
> On Fri, Nov 07, 2003 at 02:39:06PM +0100, Sebastian Kaps wrote:
> > Hi!
> >
> > Is there something concerning ReiserFS I should know when migrating from
> > Linux 2.4 to Linux 2.6?
> >
> > I'm asking because a few days ago I downloaded and compiled 2.6.0-test9
> > just for curiosity. It booted fine and I went back to my "standard"
> > kernel, which was 2.4.23-pre5 at that time. Right after booting the
> > 2.4.x kernel, I got lots of the following messages in my logs:
> > ,----
> >
> > | kernel: ide2(33,3):vs-4080: reiserfs_free_block: free_block
> > | (2103:463529)[dev:blocknr]: bit already cleared
>
> test-9/reiser3 works fine for us.  Your problems could be due to a bug in
> updated IDE driver, for example.  Do other filesystems (like ext2) work?
>
> Can you send a .config (from 2.6.0-test-9) and describe your hardware
> configuration to the reiserfs-dev@namesys.com mailing list?
>
> > `----
> > The block number always differed. Gladly, "reiserfsck --rebuild-tree"
> > helped to cure that, but there were lots of unusable files after that
> > (e.g. parts of files overwritten with parts of other files).
>
> I think that reiserfsck --rebuild-tree trusts the bitmap content, which is
> not good for your case.  Vitaly will answer better.

Bitmaps do not say that this block belongs to some particular file,
so bitmaps have nothing to do with the described problem when 
parts of files overwritten with parts of other files. But when there
are some blocks in use that have been already freed there could 
be another problem -- parts of files are lost, there are just zeroes 
in these parts, or some files are lost after fsck. Probably scanning
through all blocks of the partition with --scan-whole-partition 
option would help here, but this option should be used with 
extreme caution as you can run out of the partition space with it.

-- 
Thanks,
Vitaly Fertman
