From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: WinFS beta out
Date: Wed, 31 Aug 2005 12:01:25 -0400
Message-ID: <4315D455.1050100@suse.com>
References: <e692861c0508292136543a02e1@mail.gmail.com> <1125380557.9589.3.camel@gentoo> <4313FE21.8080709@namesys.com> <019d01c5ad68$4d5fdfa0$d60310ac@homedom> <43147EFE.2020804@perkel.com> <43150100.40304@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25755-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43150100.40304@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Marc Perkel <marc@perkel.com>, Reiserfs List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> I didn't have any role in the reiser3 acls.  I would never have designed
> them the way they got written.  If you want high performance acls,
> sponsor me to supervise the work for reiser4, and they will be very high
> performance.  Making them high performance in reiser4 is straightforward
> and easy.

I would have also rather designed them differently, as another item
associated with the key. One of the strengths of the reiserfs design was
the btree that allows nodes of various types. ACLs should have been
implemented this way, extents could have been implemented this way.

Unfortunately, when I tried doing that, I found that the implementation
does not at all live up to the design. The implementation can handle the
four core items, and those alone. The addition of a new item type causes
the system to panic. Those issues could have been fixed, but we still
would have been left with a filesystem that would panic if mounted on an
older kernel -- since reiserfs also has no concept of feature versioning.

The current implementation is hardly what I had envisioned ACLs and
xattrs being on reiserfs -- but was the only solution we could find to
still allow the filesystem to be mounted on an earlier kernel.

An ideal solution would have been to introduce reiserfs v3.7 with a new
magic, and add feature versioning to the superblock, similar to the way
ext[23] does it. I felt that would have been met with much, much more
resistance than the implementation I ultimately presented.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFDFdRVLPWxlyuTD7IRAmPpAJ9MoA9ge/yHyM4UvMdvSU25VMvYLwCcDoWt
qxZLg1eK8TExLasF287oWJc=
=7QFY
-----END PGP SIGNATURE-----
