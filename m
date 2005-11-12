From: =?ISO-8859-2?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: Re: reiser4 in 2.6.14 - lockups with mmapped files
Date: Sat, 12 Nov 2005 16:13:38 +0100
Message-ID: <437606A2.8060700@ursynow.2a.pl>
References: <1130860221.12859.23.camel@laptop> <436796F6.10603@namesys.com> <1131028204.13284.29.camel@laptop> <436A706E.2010001@free.fr> <436B8A10.3000400@namesys.com> <436BB8AF.9020103@free.fr> <20051112015840.GA28777@148.Red-217-126-33.pooles.rima-tde.net.>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26879-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051112015840.GA28777@148.Red-217-126-33.pooles.rima-tde.net.>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: rvalles <rvalles@es.gnu.org>
Cc: reiserfs-list@namesys.com

rvalles napisa=B3(a):
> Still having the same problem, with 2.6.14.2 patched with 2.6.14-1
> reiser4 patch.
>
> It's easy to trigger it while editing a file with vim, and it does take
> a hell of a long wait (while it hits the disk for a minute or so,
> sometimes) for it to unlock.
>  =20
or if  you try to run lilo... or  dpkg/apt-get its also very easy to=20
trigger it this way.

it hangs my server from time to time ... is there any progress in fixing=20
that?

