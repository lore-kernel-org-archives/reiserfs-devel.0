From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: Agressive selective pre-allocation
Date: Sat, 14 Dec 2002 02:56:41 +0100
Message-ID: <20021214025641.F2727@vestdata.no>
References: <20021210074600.J26400@vestdata.no> <200212100826.36651.russell@coker.com.au> <20021210111228.GA9155@shuttle.mothership.home.dhs.org> <20021212094754.S26400@vestdata.no> <3DF8A130.7070101@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12159-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3DF8A130.7070101@namesys.com>; from reiser@namesys.com on Thu, Dec 12, 2002 at 05:46:08PM +0300
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

On Thu, Dec 12, 2002 at 05:46:08PM +0300, Hans Reiser wrote:
> >Yes, maildir is not always faster.
> >
> >First problem is disk-layout. The way it works with reiserfs3.6 and
> >default hashes the inodes and files are written in different orders and
> >the disk does a lot of unneeded seeks.=20
> >
> You mean the names are written in an order different from the stat data=20
> and file bodies, and the stat data and file bodies have the same order.
>=20
> This is because we sort filenames by filename, and  sort stat data and=20
> file bodies by objectid which tends to be ordered by creation time.

Exactly.

> We should implement a plugin that sorts filenames by creation time, and=20
> that will cause our performance to resemble ext2 more (meaning that for=20
> large directories the performance will fall apart, but for small=20
> directories there might be some advantage from not sorting by name).=20

Yes, or you could do as I did in my maildir-specific hash - make a hash
that tends to resemble creation-order. For maildir this can be done
pretty easily as filenames can be predicted and actually contain
information about creation-order.

> I=20
> think that sorting file bodies by filename would require a larger key,=20
> so I hesitate at that, but maybe it would be interesting to explore also.

That would be _really_ interesting, but I don't understand exactly what
would be needed.=20

Am I right to assume that there are actually several seperate entities
that are related to the allocation/ordering:
- the reiserfs-key idenitfying the inode
- tree-nodes that hold the allocation-information about the file
  (I guess extent-lists in reiserfs4)
- the blocks actually allocated for the data.

So both the choice of the inode-key and the allocation-policy for new
tree-nodes and data-blocks could affect file-ordering? Since the key is
generated from the hash that should already be in directory-entry-order,
but what about the other two?

Frankly last time I checked I found the way that directories and
allocation work not too well documented. Perhaps I just didn't look the
right places... Or maybe I must just be prepared to take the time to
read the source properly to understand this.


> >It is also important that readdir-order matches the ondisk layout, but
> >that is perhaps already the case?
> >
> If you copy a directory, then after the copy the readdir order matches=20
> the ondisk layout.

Yes, that's what I do now when my maildirs get too slow. It makes a
huge difference.


--=20
Ragnar Kj=F8rstad
