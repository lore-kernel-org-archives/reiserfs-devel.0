From: Oleg Drokin <green@namesys.com>
Subject: Re: remounting r/o with mapped and deleted files
Date: Sun, 26 May 2002 11:40:50 +0400
Message-ID: <20020526114050.B11757@namesys.com>
References: <20020525193734.GB16919@vega.ipal.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10420-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020525193734.GB16919@vega.ipal.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phil Howard <phil-reiserfs@ipal.net>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, May 25, 2002 at 02:37:34PM -0500, Phil Howard wrote:

> When a file is memory mapped into a process space (e.g. executable,
> library, data, etc), and deleted, the data blocks for that file
> must still remain reserved so they can be swapped in as needed.
> If the filesystem is then remounted r/o, there is a conflict.  In
> ext2, this is resolved by disallowing the remount r/o in much the
> same way as disallowing an unmount when anything is mapped or open.

> I find this doesn't happen with reiserfs.  So I am concerned.  What
> I'd like to know is whether or not reiserfs is really doing this
> because it can handle the situation correctly, or if this is a bug.

reiserfs can handle this correctly as of version included into linux kernel
version 2.4.16, we call this feature safelinks. (or savelinks sometimes).

> Consider the sequence of events:
> 1.  A program maps in a dynamic library from a reiserfs filesystem

I believe you missed one step here:
1.5 somebody deletes the dynamic library file.

> 2.  The filesystem is remounted read/only
> 3.  The program exits leaving no more references to the deleted file
> 4.  The filesystem remounted read/write
> Is the space for the deleted file now available?

Yes.

At 2.5 point fs driver creates special key that references deleted object
as already deleted. Now we wait for "iput()" to be performed on deleted file
and looking if nlink finally reached zero.
Once it is reached then deleted key and actual object is removed from the fs.
But in this case, this does not happen, so the special key is still on the fs.
On next rw remount this key is found and the deletion is finished.

> Consider a slightly different sequence of events:
> 4.  The system is gracefully shutdown while that filesystem is read/only

The absolutely same thing occurs, file is deleted on rw mount.

> Or consider even this slightly different sequence of events:
> 4.  The system is hard reset while that filesystem is read/only

Still the same.
Actually you even may not remount the fs, and just press the reset button,
and the deletion (and truncates) would be completed after next rw mount.

> At some point, the data blocks for that deleted file must be recovered.

Sure.

> In the third sequence, the most difficult, the only opportunity I see
> for this to happen is that during the original unlink when the on-disk
> reference count (not including in-kernel-only references, such as a
> process mapping), the fact of this delete was written into a special
> journal that would NOT be played out yet (because it's not yet time to
> actually clean out the blocks), but finally had to be played out later
> when the system comes back up and the filesystem is remounted.

We are doing something that is very close to what you describe.

> So how does reiserfs do this?

In the code you can look it up as
actual deletion on rw mount: super.c::finish_unfinished()
Writing deletion marks waiting for last user of a file going away:
super.c::add_save_link()

Bye,
    Oleg
