From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser acceptance (was Re: Atomic filesystem or not)
Date: Thu, 22 Jul 2004 01:08:33 -0700
Message-ID: <40FF7601.9070509@namesys.com>
References: <200407151434.23082.marcel@hilzinger.hu> <200407151354.47063.ctpm@ist.utl.pt> <40F6DE4A.2070103@slaphack.com> <40F6E06B.1080505@namesys.com> <40F73370.2090600@slaphack.com> <40FB876E.1050200@namesys.com> <40FC3730.80908@slaphack.com> <20040720065253.GW4990@nysv.org> <40FCCC4F.6040709@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19738-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40FCCC4F.6040709@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>, Claudio Martins <ctpm@ist.utl.pt>, reiserfs-list@namesys.com, Marcel Hilzinger <marcel@hilzinger.hu>

David Masover wrote:

>
>
> Markus T=F6rnqvist wrote:
> | On Mon, Jul 19, 2004 at 04:03:44PM -0500, David Masover wrote:
> |
> | But hopefully sys_reiser4 will be the standard, yes?
> | (Also, rename it to sys_reiser, the number makes it a bit more unclear,
> | more bound to the fs, not to the guy behind it)
>
> How many versions of Reiser will there be?

One every 3-5 years for ~30 years.

>   If you can get a separate
> system call for each one, go for it.  Then you can always support
> sys_reiser4 on newer versions, and people use sys_reiser5 and so on to
> support newer features.

That was the idea.

>
> Unless, that is, you've already made it so modular that people who call
> sys_reiser on reiser4 won't find it broken on reiser5.  If you can do
> that without cruft, you are amazing, and the number should go.

I am not amazing, and prefer to keep the number.;-)

