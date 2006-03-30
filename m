From: Hans Reiser <reiser@namesys.com>
Subject: Re: IO randomly blocked for >1 minute while disk writes still in
 2.6.16.1 + 2.6.16-reiser4-1
Date: Thu, 30 Mar 2006 09:53:15 -0800
Message-ID: <442C1B0B.4060207@namesys.com>
References: <20060330023909.GA7547@rvalles.homedns.org.>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28412-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060330023909.GA7547@rvalles.homedns.org.>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: rvalles <rvalles@es.gnu.org>
Cc: reiserfs-list@namesys.com

rvalles wrote:

>A few months ago I posted about a problem I was having with kernels
>newer than 2.6.12.x, where, apparently randomly, sometimes vim or other
>programs would be blocked for more than a minute, and during the entire
>blockage, the disk would appear to be writing data.
>
>Since I saw talk on the matter, I thought it would be the mmap/fsync
>performance problem or something like that, and after so much time it
>would be fixed already, but apparently it isn't yet, which I discovered
>after building a 2.6.16.1 with the 2.6.16-reiser4-1 patch available on
>the namesys ftp server.
>
>Soon after booting my desktop system and starting X, xfce, etc. I
>started to wget the latest knoppix ISO and then started to play a movie
>with mplayer. The movie is an avi ffmpeg + mp3 at about 1mbit/s overall.
>The described blockings happened again and again during the reproduction
>of the movie. Now, just to know the format, I played it again, and as it
>began, it blocked again... not even knoppix is downloading on the
>background.
>
>I got knoppix so that I could boot it, get last reiser4tools and run a
>fsck --fix on my reiser4 partition. Since now I've already done that, I
>don't think it helped much.
>
>I attach my kernel config file. I'll be very happy to provide any other
>debug information if it's needed, or to test patches and see if they fix
>the problem. For now, I'll fall back to 2.6.12.6, which is the latest
>kernel I can use which doesn't have the problem.
>
>Sincerelly,
>Roc Vall=E8s <rvalles@es.gnu.org>
> =20
>
There is another possible explanation for your problem.  That other
explanation will be much more work for us to fix, so please tell us if
the patch you were sent fixes it, and if not then we have to do the hard
fix.

Hans
