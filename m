From: "David Dabbs" <david@dabbs.net>
Subject: RE: [RFC] Pathname Semantics with //
Date: Thu, 9 Sep 2004 14:21:18 -0500
Message-ID: <20040909191641.A33B315E8B@mail03.powweb.com>
References: <413F2FBD.9070304@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21647-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <413F2FBD.9070304@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Hans Reiser' <reiser@namesys.com>
Cc: linux-fsdevel@vger.kernel.org, 'ReiserFS List' <reiserfs-list@namesys.com>



>=20
> Use of : in addition to / is a bad idea, see The Hideous Name by Rob
> Pike for why.
>=20
> Hans
>=20

I've read The Hideous Name, and I think you're taking Pike out of =
context.
He wrote that document when device files were still only a part of a
research version of UNIX. His main point is that programs should not be
saddled with understanding physical devices when constructing filenames. =



Regarding use of colons in file name spaces, I find the following:

>name of a file is a string that identifies the disk drive holding the =
file.
>Syntax separates these componentsof the name; MS-DOS uses a colon =
following
>the disk name, a single character:=20
>
>A:FILE is a file on disk drive A, while=20
>B:FILE is a file on disk drive B.=20
>
>The advantage of putting such information in names is that software =
need
>not know about disks tomanipulate files. Internally, of course, system
>software must use the syntax of the name to locate the file,

The colon itself is not at question here, but the fact that MSDOS naming
forces software to know about disks to manipulate files.


>ucbvax were a gateway we could access files on a distant machine as
>UCBVAX::KREMVAX::file, it is only because the semantics of :: =
explicitly
>permit such access. The :: operator is implemented by passing the =
string
>after it to the remote machine, but first checking its syn-tax, so the =
file
>name parser must have special code for multiple ::'s.=20

So what if VMS used two colons? They could have been tildes. The colon =
was
incident to his primary point:

>Instead, if names had multiple components (that is, syntax), where the
>components did not necessarily correspond to physical devices, the name
>space would have the advantages of that of both MVS and MS-DOS, with =
the
>disadvantages of neither. A good example: UNIX(R)

He later gripes about the colon w.r.t the Ibis remote file system. =
Again, it
is the same complaint. But we will not be changing paths to the objects
every application understands today. An opaque escape is added to the
beginning and again at the end. Everything in between is standard UNIX
pathnames, though sometimes the use of dot is required where it may be
elided in practice today.


Regarding slashes, I can't find anywhere that Pike criticizes slashes.
Now, I can see where the proposal runs afoul of his advice that:

>The syntax should be clean and uniform; every new syntactic rule =
requires
>at least one, and usually many, semantic rules to resolve peculiarities
>introduced by the new syntax. If the name space is a tree or any other =
kind
>of graph, a single character should be used to separate nodes in a =
name.

Well, the only reason two trailing slashes are required is that we need =
some
way to distinguish a directory's named streams from its entries. What is
worse, one extra slash at the end of a directory (or two for a file) or
"/metas"?

The SuS is the standards document to which Linux and other Unices =
attempt to
conform. The proposal inherits the pre-existing double leading slash and =
the
slash pathname delimiter. If I understand you correctly, you're saying =
there
is a problem with the slash character. Could you be more specific? I =
don't
think you're proposing to change Linux path delimiter, are you?

To what the SuS allows, only the dreaded colon is added. As I said in =
the
proposal, the colon is arbitrary. Also, the colon could be elided for
relative paths, but consistency seemed important. If we patched the VFS,
etc. to support Linux-specific pathname semantics you should (with hope) =
be
able to do the following without modifying the applications:

   mkdir test
   cd test
   touch foo.txt        # dir entry
   emacs //.//foo.txt   # named stream file

All you had to do was take the existing path, "foo.txt", prepend a =
special
escape and append two slashes. The new named streams are there only for =
the
initiated applications and humans. Every other na=EFve application is =
happily
ignorant.


David


