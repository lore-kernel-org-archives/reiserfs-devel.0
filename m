From: Christian Iversen <chrivers@iversen-net.dk>
Subject: Re: Plugin for corruption resistance?
Date: Thu, 17 Feb 2005 11:53:43 +0100
Message-ID: <200502171153.43403.chrivers@iversen-net.dk>
References: <e692861c05021110583585f84e@mail.gmail.com> <loom.20050215T213823-62@post.gmane.org> <42141928.7080608@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42141928.7080608@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 17 February 2005 05:10, David Masover wrote:
> Adam wrote:
> | Hans Reiser <reiser <at> namesys.com> writes:
> |>Its on the legitimate wish list, if someone wants to code it, let me
> |> know.
> |
> | Hans, does this mean that you think that this type of functionality
>
> should be
>
> | implemented as a Reiser4 plugin and therefore in kernelspace?  Why
>
> wouldn't this
>
> | be better implemented in userspace via a daemon that is notified of file
> | modification via dnotify/inotify?
>
> Because dnotify/inotify don't scale.  I don't think they lock on event,
> either, whereas a plugin could guarentee that the hash was up-to-date
> (no race conditions).
>
> We've been over this before.  There's a reason reiser4 and its plugins
> are in kernel space, and not in something like Fuse.

And, surely, updating a hash value when 1 byte changes in a gigabyte file, 
would be much faster from kernel space where you can actually see the 
changeset?

-- 
Regards,
Christian Iversen
