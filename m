From: Oleg Drokin <green@namesys.com>
Subject: Re: another seriously corrupt ext3 -- pesky journal
Date: Tue, 19 Aug 2003 13:28:01 +0400
Message-ID: <20030819092801.GA30729@namesys.com>
References: <200308181639.h7IGdkWq019919@filer.fsl.cs.sunysb.edu> <20030818181354.GC10270@think> <20030818201609.GB10320@matchmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15376-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030818201609.GB10320@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Aug 18, 2003 at 01:16:09PM -0700, Mike Fedyk wrote:

> IIUC, reiserfs uses a logical journal, and it only does meta-data
> journaling, but not to the level of ext3's writeback mode.          

You probably meant ext3's jordered mode.
ext3's writeback mode is somewhat like reiserfs' default mode of operations
without extra journaling patches.

> There are patches to add ext3-like data journaling to reiserfs that are
> planned to be submitted for one of the next couple 2.4-pre kernels.

True.
Also Chris should be working on porting those to 2.6. At least I hope so.

> I'd be very interested in how reiserfs (and reiserfsck!) might handle a
> similar scenario. 

We do not have journal inode. If you get your journal header or superblock
corrupted, you need to run "reiserfsck --rebuild-sb" and answer some questions
about what was your FS look like (amount of questions depends on how much
journal header and superblock were damaged).
All other corruptions (bitmaps and stuff) should be handled by usual reiserfsck modes.
(reiserfsck --rebuild-tree, if corruption was not trivial)

Bye,
    Oleg
