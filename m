From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: another seriously corrupt ext3 -- pesky journal
Date: Mon, 18 Aug 2003 13:16:09 -0700
Message-ID: <20030818201609.GB10320@matchmail.com>
References: <200308181639.h7IGdkWq019919@filer.fsl.cs.sunysb.edu> <20030818181354.GC10270@think>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15368-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030818181354.GC10270@think>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, Aug 18, 2003 at 02:13:54PM -0400, Theodore Ts'o wrote:
> On Mon, Aug 18, 2003 at 12:39:46PM -0400, Erez Zadok wrote:
> > The power failure on Thursday did something evil to my ext3 file system (box
> > running RH9+patches, ext3, /dev/md0, raid5 driver, 400GB f/s using 3x200GB
> > IDE drives and one hot-spare).  The f/s got corrupt badly and the symptoms
> > are very similar to what Eddy described here:
> > 
> > 	https://www.redhat.com/archives/ext3-users/2003-July/msg00015.html
> > 
> > That is, nearly everything I try results in and error such as
> > 
> > 	"Invalid argument while checking ext3 journal for /dev/md0"
> 
> What probably happened is that the power failed while you were writing
> out the inode table, and the memory failed before the DMA engine and
> hard drive did, since DRAM tends to be more sensitive to voltage drops
> that other parts of the system.  As a result, random garbage got
> scribbled all over the disk.  (Ted 's observation: PC Class hardware
> is sh*t.)
> 
> Normally, this isn't a problem, since the ext3 journal contains full
> backups of recently written data blocks.  (As opposed to filesystems
> that use soft update or logically journaled filesystems, which are
> even more fragile in the face of cheap hardware that scribble random
> garbage on power failure.)  However, this is not true when the first

After reading this comment about logical journaling (and reading a thread
about htree and ext3 journaling a while ago, and how logical journaling
could make the problems go away there), it made me think of reiserfs 3.6,
which I have been using recently over the past six months or so. 
                               
IIUC, reiserfs uses a logical journal, and it only does meta-data
journaling, but not to the level of ext3's writeback mode.          
                               
There are patches to add ext3-like data journaling to reiserfs that are
planned to be submitted for one of the next couple 2.4-pre kernels.
                               
I'd be very interested in how reiserfs (and reiserfsck!) might handle a
similar scenario. 
                               
Mike                  
