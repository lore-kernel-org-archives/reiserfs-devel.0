From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: [RFC] Pathname Semantics with //
Date: Thu, 9 Sep 2004 19:33:05 +0200
Message-ID: <200409091933.06100.christian.mayrhuber@gmx.net>
References: <20040909103656.B15E715CB2@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21646-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040909103656.B15E715CB2@mail03.powweb.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: David Dabbs <david@dabbs.net>, linux-fsdevel@vger.kernel.org

What about using // as some URI entry point?
An URI looks like:
PROTOCOL://PROTOCOL_SPECIFIC_NAMESPACE_IMPLEMENTATION

As no one can guarantee unix semantics in an URI space only symbolic
links are allowed to and from the URL namespace.
The "protocol" names are issued by the kernel to prevent clashes and=20
fragmentation.

Some example URI's for a userspace implementation like
fuse.
//http://somehost:port/foo/bla
//tar:///path/to/some/file.tar.gz/sub/directories

That could unify the namesspace for userspace apps like gnome, kde and mc.

The / could even mean a shortcut to the //file:// URI, but loosing the=20
capability to hardlink.

If someone wants to expose filesystem metadata
something like //metas:// instead of //: could do it.

      //metas://a-directory/SomeName      regular dir entry
      //metas://a-directory//SomeName     named stream
      //metas://a-directory///SomeName    =3D=3D //metas://a-directory/Some=
Name
=20
The same applies to files as well...
      =20
      //metas://foo.txt/SomeName          ERROR
      //metas://foo.txt//SomeName         named stream
      //metas://foo.txt///SomeName        =3D=3D //metas://foo.txt/SomeName=
 =3D=3D=20
ERROR
=20
And for the root dir also...
=20
      //metas:///                         root
      //metas:////                        root's named stream dir, looks od=
d=20
but has // after //metas://
      //metas://///                       root, has /// after //metas:// an=
d=20
means / =3D=3D root dir
=20
      //metas:///.                        root
      //metas:///..                       root
      //metas:///./                       root
      //metas:///.//                      root's named stream dir
      //metas:///.///                     root
      //metas:///./.                      root
      //metas:///./..                     root
=20
      //metas://./                        curr dir
      //metas://.//                       curr dir's named stream dir
      //metas://.///                      curr dir
      //metas://./.                       curr dir

On Thursday 09 September 2004 12:41, David Dabbs wrote:
>=20
> During the recent reiser4-related namespace/semantics discussions, Alan C=
ox
> [http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D109405544711435&w=3D2] an=
d others
> referred to the Single UNIX Specification v3 (SuS) provision for
> implementation-specific pathname resolution. After a close reading of the
> SuS, here is a proposal for how we might flexibly and legally accommodate
> new filesystem features.
>=20
> Assumption
> * "Named file streams" (file-as-dir/dir-as-file/whatever) are worth
>   implementing, if only to provide Windows interoperability for Samba.
>=20
> Goals
> * No breakage for na=EFve applications.
> * No new APIs e.g. openat().
> * Maintain POSIX/SuS compliance.
> * Expose the "named streams" capability via the natural "collection of
>   files" approach as Linus called it.
>   [http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D109353819826980&w=3D2]
>=20
> Caveat
> Other than punting and prohibiting linking to objects created with=20
> a container attribute, this proposal doesn't present a solution to thorny
> issues such as locking.
>=20
> In A Nutshell
>=20
>      //:a-directory/SomeName      regular dir entry
>      //:a-directory//SomeName     named stream
>      //:foo.txt//SomeName         named stream
>      //:/.//                      root's named stream dir
>=20
>=20
> Still interested? Read on.
>=20
>=20
>=20
> What the Spec Says
>=20
> All Directories Are Files, but Not All Files Are Directories
> In SuS (3.163 File), a file is "an object that can be written to, or read
> from, or both. A file has certain attributes, including access permissions
> and type. File types include regular file, character special file, block
> special file, FIFO special file, symbolic link, socket, and directory. Ot=
her
> types of files may be supported by the implementation." This last bit is
> encouraging, as we are free to implement new file types.
>=20
> Can An Object Be More Than One Type?
> Recent debate hovered around notions of "file-as-dir" or "dir-as-file," b=
ut
> is this legal? Everywhere the SuS mentions file types they are referred to
> as "distinct file types." I didn't scan all the threads for technical
> objections to file type duality, but it seems like we should steer clear =
of
> objects that are more than one S_IFMT type. Suppose we implement a contai=
ner
> type. Is it permitted for an object to be both a file and a container?
>=20
> Pathname Resolution
> Whatever innovations people dream up, applications still need to provide a
> pathname to the existing APIs. All manner of proposals were floated for
> "named streams" -- from reiser4's "/metas" to prefixes such as ".$" or
> "...". [http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D109413602520921&w=
=3D2]
>=20
> According to SuS 4.11 Pathname Resolution,
> http://www.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap04.html#ta=
g_0
> 4_11
>    ...
>    A pathname that begins with two successive slashes may be interpreted =
in=20
>    an implementation-defined manner, although more than two leading slash=
es=20
>    shall be treated as a single slash.
>    ....
>=20
> // seems relatively clean, but if more than two leading slashes equate to
> one, how would an absolute path be specified? How about:
>=20
>     //:foo/bar/baz      relative path to foo/bar/baz
>     //:/foo/bar/baz     absolute path to /foo/bar/baz
>=20
> While other characters would work, colon seems to fit because "//:" is the
> reverse of "file://" minus file.
>=20
>=20
> The Directory Problem
> Among the issues raised is disambiguating a stream object name from an
> identically named object within a directory. With pathnames prefixed by /=
/:,
> one could use something as simple as //, e.g.
>=20
>      //:a-directory/SomeName      regular dir entry
>      //:a-directory//SomeName     named stream
>      //:a-directory///SomeName    =3D=3D //:a-directory/SomeName
>=20
> The same applies to files as well...
>      =20
>      //:foo.txt/SomeName          ERROR
>      //:foo.txt//SomeName         named stream
>      //:foo.txt///SomeName        =3D=3D //:foo.txt/SomeName =3D=3D ERROR
>=20
> And for the root dir also...
>=20
>      //:/                         root
>      //://                        root
>      //:///                       root
>=20
>      //:/.                        root
>      //:/..                       root
>      //:/./                       root
>      //:/.//                      root's named stream dir
>      //:/.///                     root
>      //:/./.                      root
>      //:/./..                     root
>=20
>      //:./                        curr dir
>      //:.//                       curr dir's named stream dir
>      //:.///                      curr dir
>      //:./.                       curr dir
>=20
> No characters or words are removed or reserved from the 'normal' namespac=
e.
> A person named Metas can still use his/her name on files, and script kidd=
ies
> can still use "...". Applications that got away with pathnames with two
> embedded slashes would need to be precise when using the new pathnames.=20
>=20
> Named Streams on Named Streams?
> If we want to do no more than allow named stream compatibility with NTFS,
> then we can prohibit "names on names". The directory referenced by foo//
> would be flat, with only one level of files allowed. Attempts to create
> something like //:/a-directory//SomeName//Another would return an error. =
It
> doesn't seem like there's any reason to disallow names on names, though.
> Stream-aware applications would simply discard the deeper streams (or
> subdirectories) in the same way that named streams are discarded when
> copying from NTFS to Linux.=20
>=20
> VFS Support
> Apps written to take advantage of the new pathname semantics will need to
> know whether it is supported under the current configuration. Would
> statvfs() be the place to inquire whether "alternate namespace" support is
> available? Would it also be necessary to require apps to query for the
> "alternate pathname prefix character" e.g. ":"? Doesn't seem necessary.=20
>=20
> link_path_walk() and other namei.c functions will need changes to support
> the // semantics. If a path component is followed by // then a macro such=
 as
> S_ISCONTAINER(stat_t) must be true.
>=20
> super_operations would need a way for filesystems to expose their support
> for the "named streams" or "container" capability.
> =20
> Any named stream object storage must count toward quotas.
>=20
>=20
> The Linking/Locking Problem
> Al Viro points out a number of serious, unaddressed issues
> [http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D109463622427391&w=3D2]
> including
>=20
> > Locking: see above - links to regular files would create directories=20
> > seen in many places.  With all related issues...
>=20
> If this cannot be solved then we can simply punt and decide that the
> container property is not automatic for all files and directories on
> filesystems that support the capability. This would be specified when the
> file or dir is created and linking to such an object would be prohibited.=
=20
>=20
> Linking to a container or to contained object presents problems, but
> creating links out of the container seems like it would be just like any
> other link object, yes?
>=20
>=20
> Other Unaddressed Issues
> Alan Cox
> > Another interesting question btw with substreams of a file is what the
> > semantics of fchown, fstat, fchmod, fchdir etc are, or of mounting a=20
> > file over a substream."
>=20
> Al Viro
> > Note that we also have fun issues with device nodes (Linus' "show
> > partitions" vs. "show metadata from hosting filesystem"), which makes
> > it even more dubious. We also have symlinks to deal with (do they have=
=20
> > attributes?  where should that be exported?)."
>=20
>=20
>=20
> David Dabbs
>=20
>=20

=2D-=20
lg, Chris

