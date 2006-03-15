From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: State of the Reiser4 FS
Date: Wed, 15 Mar 2006 14:08:09 -0700
Message-ID: <20060315210809.GS30801@schatzie.adilger.int>
References: <3aa654a40603140241s5d8a7430j6bf29a5ef7dd1bf5@mail.gmail.com> <1142336718.7415.55.camel@tribesman.namesys.com> <194f62550603140732j6ef10757j@mail.gmail.com> <4417BEC4.6060506@namesys.com> <20060315085745.GA21609@wintermute> <44185CEC.3010103@namesys.com> <20060315192730.GA11927@wintermute>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28280-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060315192730.GA11927@wintermute>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andreas =?utf-8?Q?Sch=E4fer?= <gentryx@gmx.de>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Mar 15, 2006  20:27 +0100, Andreas Sch=EF=BF=BDfer wrote:
> If it was that easy... The problem for openMosix is that most devices
> fetch data in 4k blocks via copy_from_user(). For migrated processes,
> openMosix intercepts these calls and forwards them to the node which
> currently hosts the process. This forwarding yields a high latency
> penalty.
>=20
> Obviously there are two ways to get rid of this problem:=20
>=20
> * modify _every_ Linux device driver to use a
>   _a_lot_more_than_4k_at_a_time_ approach or
>=20
> * implement a second "read ahead" buffer which fetches large blocks via
>   the network in the background and answers calls to copy_from_user()
>   directly from the local buffer

Or you can use a network filesystem like Lustre that handles this
itself ;-).  Sadly, though, it has to do both of these to get
good performance, via {sub,per}version of the VFS/VM.

Clients do delayed-write (writeback cache, with write credits from
the server to accound for space) to avoid small RPCs.  They also
do large amounts of readahead (in large chunks) to improve reads
for applications and the VM that breaks up all reads into 4kB chunks.

Servers also do batch block allocation and then large direct writes
instead of going through the VFS/VM.  There are still a number of
device drivers that break up bios into chunks smaller than 1MB, and
that hurts performance.

Having a generic delayed/batch allocation mechanism is definitely
the right way to go, and from my reading of linux-fsdevel this is
underway by some folks at IBM.  Since we have to support customers
dating back to 2.4.21 it will be a while before we can move over to
the newer APIs, once they are available.

> BTW: how are you guys planning to solve this 4k issue? Will you revert
> to small blocks or will you "pretend" to perform 4k transfers and
> assemble those in the background to, again, process large chunks at
> once? If yes, wouldn't this seriously increase CPU usage due to
> (most likely) unnecessary data duplication?

It doesn't result in data duplication, per se, since the pages are
copied into kernel space only once.  What it does mean is that there
needs to be a duplication of infrastructure in order to reassemble
and track all of these pages.

Cheers, Andreas
--
Andreas Dilger
Principal Software Engineer
Cluster File Systems, Inc.

