From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: Status of fsync() wrt mail servers
Date: Thu, 11 Sep 2003 10:25:09 -0700
Message-ID: <20030911172509.GB18399@matchmail.com>
References: <20030910002953.C14172@unbeatenpath.net> <20030910105102.GA535@rahul.net> <1063192474.18154.355.camel@tiny.suse.com> <20030910114103.GA26767@rahul.net> <1063197048.18155.357.camel@tiny.suse.com> <20030910101821.A15923@unbeatenpath.net> <20030910213244.GD1461@matchmail.com> <20030910173343.A16677@unbeatenpath.net> <20030910234927.GE1461@matchmail.com> <m3ekynbj3e.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15633-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <m3ekynbj3e.fsf@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Thu, Sep 11, 2003 at 02:33:25PM +0200, Matthias Andree wrote:
> Does reiserfs3.6 support dirsync? I thought it was ext3-specific until
> now.
> 

That was what I was asking too.

> Please take care to distinguish (file) meta data from directory data.
> 

Hmm, it seems to me, that all meta-data relating to the file fsync() was
called on should be sent to the disk and waited for by the call.

> Basically, what we know is that with Linux 2.4, ext3fs, reiserfs and XFS
> will flush all pending transactions (per file system) that were
> requested prior to a synchronous operation (fsync, sync, umount, ...)
> out to disk.
> 
> This can heftily bite your back if you're running your MTA's queue on a
> large file system that has other sustained write load (logging, data
> bases, ...).
> 
> I recently helped one qmail user debug this; the symptom was that the
> first mail in a burst of mails took 2 seconds to queue, subsequent mails
> were queued much quicker (70 ms). He was using ext3fs, and had one huge
> / (root) file system and so the "synch the whole file system" behaviour
> made his qmail-queue synch *all* his dirty blocks to disk...

Can you be sure the MTA wasn't calling sync() just to be sure (Many MTAs are
funny in that they think the spool is on a seperate disk and filesystem).
fsync() shouldn't be flushing anything not relating to the file it was
called on (that includes directory entries related to the file also IMHO).

Also, if the MTA wasn't running as root, it shouldn't be able to make sync()
affect the entire system.  Is there anything that says that sync() can't
just flush the user's buffers unless you're running as root or with some
CAP_ capability?

Mike
