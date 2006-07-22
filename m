From: David Masover <ninja@slaphack.com>
Subject: Re: future r4 maintenance question
Date: Sat, 22 Jul 2006 15:16:48 -0500
Message-ID: <44C287B0.2060907@slaphack.com>
References: <1992401892.20060722173244@wp.pl> <44C26870.6090200@namesys.com> <1287558327.20060722215128@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29149-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1287558327.20060722215128@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: =?UTF-8?B?TWFjaWVqIFNvxYJ0eXNpYWs=?= <pysiak.satriani@wp.pl>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Maciej So=C5=82tysiak wrote:

> I Understand. This is good news. Hm, do you think that reiser4's pluggabi=
lity
> is enough to have this single kernel tree (fs/reiser4) for a longer period

> away with the "future vision" and other "future *" stuff you've written
> about ? eg. I remember reading about very granular security ACLs like
> restricting a certain line in a file (like /etc/passwd)

I think the granular security ACLs were always intended to be a v4 thing=20
(with plugins).  I believe the Future Vision stuff is about even more=20
namespace unification.  I seem to remember v5 was semantic changes and=20
v6 was a semi-distributed FS, but I could have that backwards...=20
Anyway, there are definitely plans for things which are non-trivially=20
beyond the plugin capabilities of Reiser4, though they will almost=20
certainly use Reiser4 as a starting point.

There's another note to kernel developers -- if Reiser5, 6, and 7 are=20
implemented as suites of plugins on top of Reiser4, then the Reiser4=20
code will be maintained for a very long time.  Kind of like ext2 vs=20
ext3, only moreso -- a Reiser5 FS may well be a Reiser4 FS mounted with=20
additional mount options.

There is definitely a lot that can be done to move Reiser4 (as it is=20
today) closer to the Reiser4 whitepaper on the homepage.  ACLs are one=20
thing, files as a directory are another.  The idea of v4 is to do away=20
with many cases where a separate namespace is created for no good reason=20
-- for instance, where is the data in an id3 tag?  It's inside an mp3=20
file, and you can only get to it with tools written for id3 tags of mp3=20
files.  The Reiser4 concept is to allow things like that to exist, but=20
not require programs to know about libid3 or whatever.  Want to know=20
what the artist of a particular file is?

foo.mp3/.../id3/artist

Or maybe a more generic way:

foo.mp3/.../song-info/artist

That way, you could have tools which don't even have to know if the file=20
has an id3 tag, or something entirely new, or if the metadata is being=20
stored outside the main file.  It'd be entirely possible to allow that=20
file to be treated as a separate file entirely by the plugin, rather=20
than something derived from foo.mp3.

The advantages don't seem immediately obvious until you consider that=20
the program which does this doesn't have to even know that it's dealing=20
with song metadata.  Consider some of the one-line shell scripts possible:


# Change the artist name for all songs in the directory:
for i in *; do echo 'Jimi Hendrix' > foo.mp3/.../song-info/artist; done

# Make a playlist of all files by Hendrix, mp3 or otherwise:
for i in `find`; do
	if [ `cat "$i/.../song-info/artist"` =3D=3D 'Jimi Hendrix' ]; then
		echo "../$i" >> playlists/hendrix.m3u;
	fi;
done

# Copy all files needed by said playlist to a USB device:
cp playlist/hendrix.m3u/.../files/* /mnt/usb
cp playlist/hendrix.m3u /mnt/usb


I'm sure others can think of much more interesting examples.

All of that is planned for v4, eventually.  It's very pluggable.

Well, I think it is.  I don't work here...
