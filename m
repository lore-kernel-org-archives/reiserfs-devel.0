From: David Masover <ninja@slaphack.com>
Subject: Re: Fibration questions
Date: Tue, 20 Jul 2004 02:03:50 -0500
Message-ID: <40FCC3D6.1050005@slaphack.com>
References: <20040719223512.D069C15E26@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19697-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040719223512.D069C15E26@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



David Dabbs wrote:
|>David Dabbs wrote:
[...]
| [David Dabbs]
| The files don't really know their type. The filesystem/OS is deducing
this,
| yes?

Yes and no.  Yes, at first, to support apps which don't set a type on
files they create.  No, because after the type has been set to some
default, it only changes "manually" -- if the user or an app decides the
type should change.

|>This can be optimized -- a file that begins with "#!" is a script, we
|>know this because the OS does.  If the file doesn't begin with "#!", we
|>don't need to look at the rest of the line.  And for things which aren't
|>perl, that's already a simpler check than "does the file end in '.pl'?"
|>
|>On top of that, we only have to assign the file type once -- at
|>creation.  For the rest of the file's lifetime, until someone decides to
|>change its type, the type is a bit of static metadata, as optimized
|>(fast/small) as file permissions, much faster and smaller than file
|>extensions.
|>
|
| [David Dabbs]
| True, but this would need to be recomputed when some process changes the
| file contents that contributed to the initial type signature.

Not really.  I mean, yes, to be perfectly consistent.  But no, because
if I named a file '.pl', and then changed its contents to a shell
script, I have to rename it to a '.sh' anyway.  So I'd probably change
its type somewhere in there anyway.  It would probably be an acceptable
performance hit for vim to request that the fs try and re-type (scan the
~ magic) at every write.  Just not for, say, mysql, for which the file
type is static but there are tons of writes.

| [David Dabbs]
| True. But in today's extension-based 'consensus,' there is no coordination
| required between _anyone_ if some enterprising developer creates a
great new
| file format for, say, music files. Applications that decide to consume
these

True, but it's clumsy.  Read on:

| files simply add *.foo to the list of files presented to users. Using

So if I made a text format with extension foo, and Notepad decided to
consume it, and then someone made a video format with extension foo,
then Notepad now shows me files that it doesn't know what to do with.

Also, file types are "associated" in Windows, and users expect to be
able to click on a file from the Windows Explorer and have it open in
the right app.

| metas/type, file type creators and application developers would need to
| share and maintain consistent type IDs/signatures namespace. I'm not
against

No, not any more than above.  If such things could be altered during
runtime, an app really only has to register on the local machine.  Yeah,
you'd want to share and maintain it, but it'd be possible to write type
names and signatures that are much less ambiguous than three-letter
extensions -- especially because, since a file can have multiple types
but only one primary, you can always name the primary file type
'<yourname>-<appname>-<description>' or something.  Behind the scenes,
the names all get mapped to a number anyway, so there's no performance hit.

| [David Dabbs]
| While I'm a reiser4 'true believer,' other VFS filesystems do and will
| continue to exist. Might an application developer's job be complicated if
| not every filesystem for which it presents a file list supports metas or
| some means to query file objects' type?

Application developer, no.  VFS developer, yes.  Unless Reiser4 becomes
a standard, the easiest way to go is to use an existing VFS or some kind
of library to get the file type.  So app X could use Gnome VFS, and
Gnome VFS could use file extensions if reiser4 wasn't available.

| [David Dabbs]
| I do think a file type is metadata. And it would certainly be nice to
search
| by and (quickly) find a file by its type. But I think the APIs, etc. above
| the filesystem(s) will first need to incorporate a notion of type. Until
| applications/users start screaming for filesystem type attributes/queries,
| the fs overhead and effort involved to figure it out doesn't really seem

Not much fs overhead.  Effort involved to figure it out seems to mostly
be me trying to express myself ;) although I acknowledge that it may be
non-trivial to implement.

| worth it.

Is it really worth it to have a ..metas dir when we already have xattrs?
~ Not yet -- I don't use either.  Eventually, when apps start to support
..metas, it will be very much worth it.

Also, until the FS supports a notion of type, either we're building a
layer on top of it (VFS) or using a crude hack (extensions).  As long as
the hack is available, btw, no one will try to solve the problem the
right way.

And I don't know about Gnome VFS, but Nautilus already supports a notion
of type.  It's just very centrallized and based on extensions.  Wouldn't
be too hard to port to fs-based types.

| One thing to note when coming up with a fibration-compatible type
signature
| is that r4's key structure only provides 7 bits with which to work.
I'd bet
| that there are many more than 7 bits worth of distinct file types out
there.

Maybe this has moved beyond fibration :P
Or maybe fibration would be better handled by the grosser types --
"text", "script", "video", "audio", "binary", "library"...  Of course
you'd need a central list.  Which is what we've got right now, only it
uses a handful of very common extensions.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQPzD1ngHNmZLgCUhAQL1Qg/+MEUi/Bbdv7ziA0A/bKtGLVmmPvB5UKGr
KZ4U8kgUWAEYoTKtqF/WMYrzhn/gUlzozLpyAoVYKZ2C8rKbF7tBKvGiZYuGCIVm
ZKIb9kdj+TbZaQ5BKBPvvVXKNdaLRo+r68YZSMO4YhsYsnrUjcxB7GNPmKZ1LS8v
NxCDVA/31HLHhn+kF+u3xdadCctduiyIgmRqZg6zUkp6yQPCAmMTT26s7iR/UqxQ
6UsGcd66OKZIWQn5hGA2uTj4MlNBaHMOluWcaN6GV1RIEci/ACnOgoIeZS2N9q5+
zLbw7GMWcXUbD2w6tZPuKJJqff24z0oMzpQbzyJ0XgyhNRu5mT1HVQ1Pp/SkhT5Q
3FMhgpOM8DevaCWGoeEunOAr1jdXSE55eN6/y9RcIM6iAqAN2jUJK+ZjhFSAxcaO
4NHa00/N55WRH8ZKFBSnNyvVQwDp+3VKlvfFo/bw8n8C79RzazCFs04Pxo1F8hnC
CUdIuXBRoVszHkLM5f0Y0hLdqlyzf0kHfOKn/Rz5EE3/aNacneuaoehcVRv+k0Bk
EdwYM8okmqLKogM6AUvNukLmdG7nHm2cei/XuUFyln3fTrB+C1wIgO9LwAxqLZAq
EXREghOnwC/nqGKuBzJOatCZHUIj/Fy0RMO5at80v1LxzHZP2PuArS6vYajHm/jI
zDcxpbDUZlo=
=kUWM
-----END PGP SIGNATURE-----
