From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: [RFC] Pathname Semantics with //
Date: Fri, 10 Sep 2004 13:06:51 +0200
Message-ID: <200409101306.51871.christian.mayrhuber@gmx.net>
References: <20040909103656.B15E715CB2@mail03.powweb.com> <200409091933.06100.christian.mayrhuber@gmx.net> <20040909230333.GB8464@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21675-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040909230333.GB8464@mail.shareable.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org

On Friday 10 September 2004 01:03, Jamie Lokier wrote:
> Christian Mayrhuber wrote:
> > //http://somehost:port/foo/bla
>=20
> While we're here, I'll point out that http://somehost/foo/bla and
> http://somehost/foo/bla/ are valid, distinct URLs.
>=20
> If http://somehost/foo/bla/ exists, many HTTP servers will return it
> as the target of a redirect for http://somehost/foo/bla.  The reason
> for this is that it's important for any relative URLs in a document to
> be resolved relative to the correct base URL of the document.
>=20
> If we do actually allow file-and-directory objects, it makes sense for
> the path _with_ slash on the end (//http://somehost/foo/bla/) to be
> accessible as both a file and a directory, mapping to that HTTP
> resource, and resources below it in the path hierarchy.
>=20
> Then relative paths in the resource resolve sensibly in programs which
> think they're in the local filesystem.
>=20
> It also makes sense for the path _without_ slash to be recognisable to
> programs as needing the slash.  That could be done by making the path
> without slash by a symlink to one with (symlinks are a natural
> representation of redirects).  But that seems like a gross violation
> of POSIX semantics: we can't really return different objects depending
> on the trailing slash.

Agreed this is a problem.
I'd say that the kernel cannot gurantee to be posix conformant in the=20
protocol space, because most protocols are not designed to be
posix compliant.
Excerpt from David's first email:
>4_11
>=A0 =A0...
>=A0 =A0A pathname that begins with two successive slashes may be interpret=
ed in=20
>=A0 =A0an implementation-defined manner, although more than two leading sl=
ashes=20
>=A0 =A0shall be treated as a single slash.
>=A0 =A0....
That would mean no posix conformance for paths starting with //, because it=
=20
depends on the implementation. Except maybe //: or //file:// or //metas:// =
or
what ever name the metadata advanced namespace carries.

>=20
> So instead, it makes sense for either form of the path to be a
> file-and-directory object whose type is S_IFDIR, and specifically not
> S_IFREG -- but only in the cases where the HTTP transaction to the URL
> without a trailing slash returns a redirect to the same URL with a
> slash appended.  When the HTTP transaction to the URL without a
> trailing slash returns a resource, then it's type in the filesystem
> should be S_IFREG, but still a file-as-directory object.
>=20
> Food for thought.
>=20
> -- Jamie
>=20
I'd say the userspace protocol handler should answer the question
where the url is pointing to and if it's a file or directory, if it follows=
=20
redirects, etc.
A http implementation may well only provide S_IFREG types as return values.
I don't think that cd //http://somehost/some/path/ will ever work, because
one will see http://somehost/some/path/index.html|php|cgi|jsp for sure.

I think for //ftp:// posix conformity could be guaranteed for names, but no=
t=20
for more advanced features like locking.

Don't let the kernel decide how to deal with the different protocols it onl=
y=20
needs to know what userspace handler to ask.

=2D-=20
lg, Chris
