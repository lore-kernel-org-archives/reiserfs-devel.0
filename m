From: Hans Reiser <reiser@namesys.com>
Subject: Re: [RFC] Pathname Semantics with //
Date: Wed, 08 Sep 2004 09:13:49 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <413F2FBD.9070304@namesys.com>
References: <20040909103656.B15E715CB2@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040909103656.B15E715CB2@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: linux-fsdevel@vger.kernel.org, 'ReiserFS List' <reiserfs-list@namesys.com>

Use of : in addition to / is a bad idea, see The Hideous Name by Rob=20
Pike for why.

Hans

David Dabbs wrote:

>During the recent reiser4-related namespace/semantics discussions, Ala=
n Cox
>[http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D109405544711435&w=3D2]=
 and others
>referred to the Single UNIX Specification v3 (SuS) provision for
>implementation-specific pathname resolution. After a close reading of =
the
>SuS, here is a proposal for how we might flexibly and legally accommod=
ate
>new filesystem features.
>
>Assumption
>* "Named file streams" (file-as-dir/dir-as-file/whatever) are worth
>  implementing, if only to provide Windows interoperability for Samba.
>
>Goals
>* No breakage for na=EFve applications.
>* No new APIs e.g. openat().
>* Maintain POSIX/SuS compliance.
>* Expose the "named streams" capability via the natural "collection of
>  files" approach as Linus called it.
>  [http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D109353819826980&w=3D=
2]
>
>Caveat
>Other than punting and prohibiting linking to objects created with=20
>a container attribute, this proposal doesn't present a solution to tho=
rny
>issues such as locking.
>
>In A Nutshell
>
>     //:a-directory/SomeName      regular dir entry
>     //:a-directory//SomeName     named stream
>     //:foo.txt//SomeName         named stream
>     //:/.//                      root's named stream dir
>
>
>Still interested? Read on.
>
>
>
>What the Spec Says
>
>All Directories Are Files, but Not All Files Are Directories
>In SuS (3.163 File), a file is "an object that can be written to, or r=
ead
>from, or both. A file has certain attributes, including access permiss=
ions
>and type. File types include regular file, character special file, blo=
ck
>special file, FIFO special file, symbolic link, socket, and directory.=
 Other
>types of files may be supported by the implementation." This last bit =
is
>encouraging, as we are free to implement new file types.
>
>Can An Object Be More Than One Type?
>Recent debate hovered around notions of "file-as-dir" or "dir-as-file,=
" but
>is this legal? Everywhere the SuS mentions file types they are referre=
d to
>as "distinct file types." I didn't scan all the threads for technical
>objections to file type duality, but it seems like we should steer cle=
ar of
>objects that are more than one S_IFMT type. Suppose we implement a con=
tainer
>type. Is it permitted for an object to be both a file and a container?
>
>Pathname Resolution
>Whatever innovations people dream up, applications still need to provi=
de a
>pathname to the existing APIs. All manner of proposals were floated fo=
r
>"named streams" -- from reiser4's "/metas" to prefixes such as ".$" or
>"...". [http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D109413602520921=
&w=3D2]
>
>According to SuS 4.11 Pathname Resolution,
>http://www.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap04.html=
#tag_0
>4_11
>   ...
>   A pathname that begins with two successive slashes may be interpret=
ed in=20
>   an implementation-defined manner, although more than two leading sl=
ashes=20
>   shall be treated as a single slash.
>   ....
>
>// seems relatively clean, but if more than two leading slashes equate=
 to
>one, how would an absolute path be specified? How about:
>
>    //:foo/bar/baz      relative path to foo/bar/baz
>    //:/foo/bar/baz     absolute path to /foo/bar/baz
>
>While other characters would work, colon seems to fit because "//:" is=
 the
>reverse of "file://" minus file.
>
>
>The Directory Problem
>Among the issues raised is disambiguating a stream object name from an
>identically named object within a directory. With pathnames prefixed b=
y //:,
>one could use something as simple as //, e.g.
>
>     //:a-directory/SomeName      regular dir entry
>     //:a-directory//SomeName     named stream
>     //:a-directory///SomeName    =3D=3D //:a-directory/SomeName
>
>The same applies to files as well...
>     =20
>     //:foo.txt/SomeName          ERROR
>     //:foo.txt//SomeName         named stream
>     //:foo.txt///SomeName        =3D=3D //:foo.txt/SomeName =3D=3D ER=
ROR
>
>And for the root dir also...
>
>     //:/                         root
>     //://                        root
>     //:///                       root
>
>     //:/.                        root
>     //:/..                       root
>     //:/./                       root
>     //:/.//                      root's named stream dir
>     //:/.///                     root
>     //:/./.                      root
>     //:/./..                     root
>
>     //:./                        curr dir
>     //:.//                       curr dir's named stream dir
>     //:.///                      curr dir
>     //:./.                       curr dir
>
>No characters or words are removed or reserved from the 'normal' names=
pace.
>A person named Metas can still use his/her name on files, and script k=
iddies
>can still use "...". Applications that got away with pathnames with tw=
o
>embedded slashes would need to be precise when using the new pathnames=
=2E=20
>
>Named Streams on Named Streams?
>If we want to do no more than allow named stream compatibility with NT=
=46S,
>then we can prohibit "names on names". The directory referenced by foo=
//
>would be flat, with only one level of files allowed. Attempts to creat=
e
>something like //:/a-directory//SomeName//Another would return an erro=
r. It
>doesn't seem like there's any reason to disallow names on names, thoug=
h.
>Stream-aware applications would simply discard the deeper streams (or
>subdirectories) in the same way that named streams are discarded when
>copying from NTFS to Linux.=20
>
>VFS Support
>Apps written to take advantage of the new pathname semantics will need=
 to
>know whether it is supported under the current configuration. Would
>statvfs() be the place to inquire whether "alternate namespace" suppor=
t is
>available? Would it also be necessary to require apps to query for the
>"alternate pathname prefix character" e.g. ":"? Doesn't seem necessary=
=2E=20
>
>link_path_walk() and other namei.c functions will need changes to supp=
ort
>the // semantics. If a path component is followed by // then a macro s=
uch as
>S_ISCONTAINER(stat_t) must be true.
>
>super_operations would need a way for filesystems to expose their supp=
ort
>for the "named streams" or "container" capability.
>=20
>Any named stream object storage must count toward quotas.
>
>
>The Linking/Locking Problem
>Al Viro points out a number of serious, unaddressed issues
>[http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D109463622427391&w=3D2]
>including
>
> =20
>
>>Locking: see above - links to regular files would create directories=20
>>seen in many places.  With all related issues...
>>   =20
>>
>
>If this cannot be solved then we can simply punt and decide that the
>container property is not automatic for all files and directories on
>filesystems that support the capability. This would be specified when =
the
>file or dir is created and linking to such an object would be prohibit=
ed.=20
>
>Linking to a container or to contained object presents problems, but
>creating links out of the container seems like it would be just like a=
ny
>other link object, yes?
>
>
>Other Unaddressed Issues
>Alan Cox
> =20
>
>>Another interesting question btw with substreams of a file is what th=
e
>>semantics of fchown, fstat, fchmod, fchdir etc are, or of mounting a=20
>>file over a substream."
>>   =20
>>
>
>Al Viro
> =20
>
>>Note that we also have fun issues with device nodes (Linus' "show
>>partitions" vs. "show metadata from hosting filesystem"), which makes
>>it even more dubious. We also have symlinks to deal with (do they hav=
e=20
>>attributes?  where should that be exported?)."
>>   =20
>>
>
>
>
>David Dabbs
>
>
>
> =20
>

-
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
