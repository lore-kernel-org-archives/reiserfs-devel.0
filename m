From: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Subject: Re: Bug report with its cancellation?
Date: Mon, 5 Jul 2004 00:10:22 +0200
Message-ID: <200407050010.22574.henning-04@die.informatik.uni-siegen.de>
References: <20040704172135.GR4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19505-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040704172135.GR4990@nysv.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Am Sonntag, 4. Juli 2004 19:21 schrieb Markus T=F6rnqvist:
> Hi!
>
> How well do the auto-snapshots work for people in general?

I tried the 2004.06.30-19 snapshot, with 2.6.7-mm4 some days ago. The first=
=20
access to a reiser4 partition produce a kernel oops, something about an=20
assertion error.

My config:
CONFIG_REISER4_FS=3Dy
CONFIG_REISER4_LARGE_KEY=3Dy
CONFIG_REISER4_CHECK=3Dy
CONFIG_REISER4_DEBUG=3Dy
CONFIG_REISER4_DEBUG_OUTPUT=3Dy
CONFIG_REISER4_USE_EFLUSH=3Dy

> I don't know what to think, because I got my kernel working now,
> like an act of god, or Nikita Danilov. I asked him to review a bug
> report I thought about sending, but it appears mm/vmscan.c has
> static int kswapd instead of int kswapd.

My kernel source has also the mentioned static variable. I'll try tomorow t=
o=20
remove the static definition. Perhaps it makes a difference..

Best regards,

Henning
