From: =?utf-8?Q?Maciej_So=C5=82tysiak?= <pysiak.satriani@wp.pl>
Subject: Re: future r4 maintenance question
Date: Sat, 22 Jul 2006 23:26:28 +0200
Message-ID: <1368904392.20060722232628@wp.pl>
References: <1992401892.20060722173244@wp.pl> <44C26870.6090200@namesys.com> <1287558327.20060722215128@wp.pl> <44C287B0.2060907@slaphack.com>
Reply-To: =?utf-8?Q?Maciej_So=C5=82tysiak?= <pysiak.satriani@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29151-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C287B0.2060907@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, reiserfs-list@namesys.com

Hello David,

Saturday, July 22, 2006, 10:16:48 PM, you wrote:
> There's another note to kernel developers -- if Reiser5, 6, and 7 are
> implemented as suites of plugins on top of Reiser4, then the Reiser4 
> code will be maintained for a very long time.  Kind of like ext2 vs 
> ext3, only moreso -- a Reiser5 FS may well be a Reiser4 FS mounted with
> additional mount options.
This the exact information I was hoping to get. I think it's important
for people to realize it. Thanks.

> # Make a playlist of all files by Hendrix, mp3 or otherwise:
> for i in `find`; do
>         if [ `cat "$i/.../song-info/artist"` == 'Jimi Hendrix' ]; then
>                 echo "../$i" >> playlists/hendrix.m3u;
>         fi;
> done
I've read about this :-)

Are plugins for such a thing entirely/mostly kernel-space?

I mean, the power of FUSE is being in user-space...
If there was an API to write a id3 plugin it propably be more
beneficial.

Well, it's plugins. If someone writes a kernelspace id3 plugin,
someone else could write a kernelspace plugin with a userspace
supplied configuration.

-- 
Best regards,
Maciej


