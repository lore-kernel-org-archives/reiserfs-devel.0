From: Francesco Biscani <frbiscani@jumpy.it>
Subject: Re: reiser4 crash
Date: Sun, 25 Jul 2004 21:37:26 +0200
Message-ID: <200407252137.26653.frbiscani@jumpy.it>
References: <200407241827.54674.frbiscani@jumpy.it> <20040725074108.GR4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19798-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040725074108.GR4990@nysv.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?iso-8859-1?q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

On Sunday 25 July 2004 09:41, Markus T=F6rnqvist wrote:
> On Sat, Jul 24, 2004 at 06:27:54PM +0200, Francesco Biscani wrote:
> >Hope this is useful. I'll be glad to give more details is asked to.
> >Regards,
>
> Try patching in
> http://mjt.nysv.org/reiser/log-write-readpage-releasepage-2.diff.gz
>
> Then recompile the kernel with debugging and assertions (printing was iirc
> not required) turned on and try to reproduce it.
>

Well, I'll try to do something but it'll be difficult. On the laptop I have=
=20
reiser4 on /, and I cannot afford to break it. I could try on the workstati=
on=20
at home where I have a test partition for reiser4, but I'll be away until t=
he=20
next weekend. Maybe some other Gentoo user could help (Redeeman are you=20
listening? :))

> Note, that this may cause your system to oops and go haywire big time, so
> if you have a netconsole or something to log, it's great.
> One other method is cat /proc/kmsg > foo and scping foo elsewhere before
> the computer goes down.
>

Ok.

An update: I have found a dir called=20

"lost_name_<insert garbage here>"

I've fixed the name, which obviously was lost during --build-fs. I'm gettin=
g a=20
bit psychotic about this but is there anything I can do to make sure=20
everything is alright? I've searched for other lost names but I found=20
nothing. The system is working as normal. Should I expect that something wa=
s=20
lost at all? It is a bit strange because the dir with the garbled name was=
=20
not open in write mode when the crash happened. Should I expect random=20
corruption to be happened?

Thanks very much.
