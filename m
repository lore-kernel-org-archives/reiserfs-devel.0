From: "David Dabbs" <david@dabbs.net>
Subject: [RFC] Pathname Semantics with //
Date: Thu, 9 Sep 2004 05:41:31 -0500
Message-ID: <20040909103656.B15E715CB2@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21639-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-fsdevel@vger.kernel.org, 'ReiserFS List' <reiserfs-list@namesys.com>



During the recent reiser4-related namespace/semantics discussions, Alan =
Cox
[http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D109405544711435&w=3D2] =
and others
referred to the Single UNIX Specification v3 (SuS) provision for
implementation-specific pathname resolution. After a close reading of =
the
SuS, here is a proposal for how we might flexibly and legally =
accommodate
new filesystem features.

Assumption
* "Named file streams" (file-as-dir/dir-as-file/whatever) are worth
  implementing, if only to provide Windows interoperability for Samba.

Goals
* No breakage for na=EFve applications.
* No new APIs e.g. openat().
* Maintain POSIX/SuS compliance.
* Expose the "named streams" capability via the natural "collection of
  files" approach as Linus called it.
  [http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D109353819826980&w=3D2]

Caveat
Other than punting and prohibiting linking to objects created with=20
a container attribute, this proposal doesn't present a solution to =
thorny
issues such as locking.

In A Nutshell

     //:a-directory/SomeName      regular dir entry
     //:a-directory//SomeName     named stream
     //:foo.txt//SomeName         named stream
     //:/.//                      root's named stream dir


Still interested? Read on.



What the Spec Says

All Directories Are Files, but Not All Files Are Directories
In SuS (3.163 File), a file is "an object that can be written to, or =
read
from, or both. A file has certain attributes, including access =
permissions
and type. File types include regular file, character special file, block
special file, FIFO special file, symbolic link, socket, and directory. =
Other
types of files may be supported by the implementation." This last bit is
encouraging, as we are free to implement new file types.

Can An Object Be More Than One Type?
Recent debate hovered around notions of "file-as-dir" or "dir-as-file," =
but
is this legal? Everywhere the SuS mentions file types they are referred =
to
as "distinct file types." I didn't scan all the threads for technical
objections to file type duality, but it seems like we should steer clear =
of
objects that are more than one S_IFMT type. Suppose we implement a =
container
type. Is it permitted for an object to be both a file and a container?

Pathname Resolution
Whatever innovations people dream up, applications still need to provide =
a
pathname to the existing APIs. All manner of proposals were floated for
"named streams" -- from reiser4's "/metas" to prefixes such as ".$" or
"...". =
[http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D109413602520921&w=3D2]

According to SuS 4.11 Pathname Resolution,
http://www.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap04.html#ta=
g_0
4_11
   ...
   A pathname that begins with two successive slashes may be interpreted =
in=20
   an implementation-defined manner, although more than two leading =
slashes=20
   shall be treated as a single slash.
   ....

// seems relatively clean, but if more than two leading slashes equate =
to
one, how would an absolute path be specified? How about:

    //:foo/bar/baz      relative path to foo/bar/baz
    //:/foo/bar/baz     absolute path to /foo/bar/baz

While other characters would work, colon seems to fit because "//:" is =
the
reverse of "file://" minus file.


The Directory Problem
Among the issues raised is disambiguating a stream object name from an
identically named object within a directory. With pathnames prefixed by =
//:,
one could use something as simple as //, e.g.

     //:a-directory/SomeName      regular dir entry
     //:a-directory//SomeName     named stream
     //:a-directory///SomeName    =3D=3D //:a-directory/SomeName

The same applies to files as well...
     =20
     //:foo.txt/SomeName          ERROR
     //:foo.txt//SomeName         named stream
     //:foo.txt///SomeName        =3D=3D //:foo.txt/SomeName =3D=3D =
ERROR

And for the root dir also...

     //:/                         root
     //://                        root
     //:///                       root

     //:/.                        root
     //:/..                       root
     //:/./                       root
     //:/.//                      root's named stream dir
     //:/.///                     root
     //:/./.                      root
     //:/./..                     root

     //:./                        curr dir
     //:.//                       curr dir's named stream dir
     //:.///                      curr dir
     //:./.                       curr dir

No characters or words are removed or reserved from the 'normal' =
namespace.
A person named Metas can still use his/her name on files, and script =
kiddies
can still use "...". Applications that got away with pathnames with two
embedded slashes would need to be precise when using the new pathnames.=20

Named Streams on Named Streams?
If we want to do no more than allow named stream compatibility with =
NTFS,
then we can prohibit "names on names". The directory referenced by foo//
would be flat, with only one level of files allowed. Attempts to create
something like //:/a-directory//SomeName//Another would return an error. =
It
doesn't seem like there's any reason to disallow names on names, though.
Stream-aware applications would simply discard the deeper streams (or
subdirectories) in the same way that named streams are discarded when
copying from NTFS to Linux.=20

VFS Support
Apps written to take advantage of the new pathname semantics will need =
to
know whether it is supported under the current configuration. Would
statvfs() be the place to inquire whether "alternate namespace" support =
is
available? Would it also be necessary to require apps to query for the
"alternate pathname prefix character" e.g. ":"? Doesn't seem necessary.=20

link_path_walk() and other namei.c functions will need changes to =
support
the // semantics. If a path component is followed by // then a macro =
such as
S_ISCONTAINER(stat_t) must be true.

super_operations would need a way for filesystems to expose their =
support
for the "named streams" or "container" capability.
=20
Any named stream object storage must count toward quotas.


The Linking/Locking Problem
Al Viro points out a number of serious, unaddressed issues
[http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D109463622427391&w=3D2]
including

> Locking: see above - links to regular files would create directories=20
> seen in many places.  With all related issues...

If this cannot be solved then we can simply punt and decide that the
container property is not automatic for all files and directories on
filesystems that support the capability. This would be specified when =
the
file or dir is created and linking to such an object would be =
prohibited.=20

Linking to a container or to contained object presents problems, but
creating links out of the container seems like it would be just like any
other link object, yes?


Other Unaddressed Issues
Alan Cox
> Another interesting question btw with substreams of a file is what the
> semantics of fchown, fstat, fchmod, fchdir etc are, or of mounting a=20
> file over a substream."

Al Viro
> Note that we also have fun issues with device nodes (Linus' "show
> partitions" vs. "show metadata from hosting filesystem"), which makes
> it even more dubious. We also have symlinks to deal with (do they have =

> attributes?  where should that be exported?)."



David Dabbs

