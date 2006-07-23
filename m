From: Hans Reiser <reiser@namesys.com>
Subject: Re: future r4 maintenance question
Date: Sun, 23 Jul 2006 00:23:38 -0600
Message-ID: <44C315EA.4080903@namesys.com>
References: <1992401892.20060722173244@wp.pl> <44C26870.6090200@namesys.com> <1287558327.20060722215128@wp.pl> <44C287B0.2060907@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29155-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C287B0.2060907@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: =?UTF-8?B?TWFjaWVqIFNvxYJ0eXNpYWs=?= <pysiak.satriani@wp.pl>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>



I am going to do the enhanced semantics first, so that somebody does not
beat me to it.

David's examples are good.

>
> There's another note to kernel developers -- if Reiser5, 6, and 7 are
> implemented as suites of plugins on top of Reiser4, then the Reiser4
> code will be maintained for a very long time.  Kind of like ext2 vs
> ext3, only moreso -- a Reiser5 FS may well be a Reiser4 FS mounted
> with additional mount options.
>
> There is definitely a lot that can be done to move Reiser4 (as it is
> today) closer to the Reiser4 whitepaper on the homepage.  ACLs are one
> thing, files as a directory are another.  The idea of v4 is to do away
> with many cases where a separate namespace is created for no good
> reason -- for instance, where is the data in an id3 tag?  It's inside
> an mp3 file, and you can only get to it with tools written for id3
> tags of mp3 files.  The Reiser4 concept is to allow things like that
> to exist, but not require programs to know about libid3 or whatever. 
> Want to know what the artist of a particular file is?
>
> foo.mp3/.../id3/artist
>
> Or maybe a more generic way:
>
> foo.mp3/.../song-info/artist
>
> That way, you could have tools which don't even have to know if the
> file has an id3 tag, or something entirely new, or if the metadata is
> being stored outside the main file.  It'd be entirely possible to
> allow that file to be treated as a separate file entirely by the
> plugin, rather than something derived from foo.mp3.
>
> The advantages don't seem immediately obvious until you consider that
> the program which does this doesn't have to even know that it's
> dealing with song metadata.  Consider some of the one-line shell
> scripts possible:
>
>
> # Change the artist name for all songs in the directory:
> for i in *; do echo 'Jimi Hendrix' > foo.mp3/.../song-info/artist; done
>
> # Make a playlist of all files by Hendrix, mp3 or otherwise:
> for i in `find`; do
>     if [ `cat "$i/.../song-info/artist"` == 'Jimi Hendrix' ]; then
>         echo "../$i" >> playlists/hendrix.m3u;
>     fi;
> done
>
> # Copy all files needed by said playlist to a USB device:
> cp playlist/hendrix.m3u/.../files/* /mnt/usb
> cp playlist/hendrix.m3u /mnt/usb
>
>
> I'm sure others can think of much more interesting examples.
>
> All of that is planned for v4, eventually.  It's very pluggable.
>
> Well, I think it is.  I don't work here...
>
>

