From: Bodo Eggert <7eggert@gmx.de>
Subject: Re: file as a directory
Date: Fri, 26 Nov 2004 05:11:53 +0100
Message-ID: <E1CXXSb-0000bz-00@be1.7eggert.dyndns.org>
References: <fa.imi6gu8.1e7qkqc@ifi.uio.no> <fa.hcr9rb0.k6egam@ifi.uio.no>
Reply-To: 7eggert@nurfuerspam.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-list-return-22580-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martin Waitz <tali@admingilde.org>, Amit Gud <amitgud1@gmail.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Martin Waitz wrote:
> On Mon, Nov 22, 2004 at 08:34:02AM -0700, Zan Lynx wrote:

>> There are already several things in filesystems that don't strictly
>> belong inside the kernel.  A filesystem could be implemented quite well
>> as a user-space daemon that sat on top of the block device and
>> communicated via sockets or shared memory just like an X server.
> 
> this is quite different.
> As you need to enforce security policies when accessing the block
> device, you have to move the filesystem into its own daemon.
> You cannot do it in a library.

Only the mapping from block-nr to uid/gid/perms needs to be in the kernel.
The rest can be done in userspace, but it would be ugly as hell.

> It is irrelevant for the application weather the fs resides in a
> separate daemon or in the kernel itself.

ACK.

> But support of different views on files is something different.
> You can do that in a library, you only need an interface that is
> capable of storing your data. The kernel already provides that
> interface.

If you want to allow users to set their default shell using some extension,
a simple userspace library will not do the job. You'll need a central
authority that is able to synchronize the access to the file, prevent
unauthorized modifications, do the caching etc.

I think the special file handlers should generally be daemons, but the
access should be controlled by kernel hooks, maybe something like
automounting a userspace filesystem. Simple meta-filesystems, e.g. those
that could be "emulated" using mount -oloop, may reside in the kernel
space, more complicated but common ones may be stored in the kernel
(placed on the initramfs?) to accelerate starting the helper daemon and
uncommon ones would be registered at runtime (maybe user-specific).

Having functions in the kernel to support those filesystems in the kernel
will help, e.g. a tgz helper daemon would need to allocate temporary
storage for accelerating access (e.g. file tree, cache) as well as means
to reassemble the tgz for operations on the whole file after write
operations occured. Meta-filesystems on fs without these features can
(off cause) be done, but I think they would be very slow or show
inconsitencies in certain situations.
-- 
Bug? That's not a bug, that's a feature. 
