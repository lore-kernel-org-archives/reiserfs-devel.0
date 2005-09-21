From: michael chang <thenewme91@gmail.com>
Subject: Re: Compression Plugin
Date: Tue, 20 Sep 2005 21:51:28 -0400
Message-ID: <b14e81f00509201851518accd4@mail.gmail.com>
References: <433017C1.4050408@gmail.com> <43307E49.8060404@slaphack.com>
	 <e692861c05092015364a887a44@mail.gmail.com>
Reply-To: thenewme91@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26186-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c05092015364a887a44@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gmaxwell@gmail.com
Cc: David Masover <ninja@slaphack.com>, Clay Barnes <clay.barnes@gmail.com>, reiserfs-list@namesys.com

On 9/20/05, Gregory Maxwell <gmaxwell@gmail.com> wrote:
> An interesting idea:  select the algo and a range of compression
> levels per file, but select the actual compression level at flush time
> based on some estimate of how loaded the system is.. :)
> Probably not worth it even though the amount of compression and the
> speed differ greatly from -1 to -9... I hope no one wastes their time
> on it until the more important things are done.. but perhaps a nice
> touch.

Kinda makes it sound like in addition to the "repacker" that repacks
blocks in order and squeezes them, (which should allow for filesystem
size reduction), there'll be a compression repacker too that allows
you to repack files to a higher or lower compression level (anyone
remember the Compression Agent that came with DoubleSpace and the like
in Windows 9x?).

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
