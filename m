From: Ragnar =?iso-8859-15?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: Advangates (A file-based interface for mount)
Date: Thu, 10 Jul 2003 06:56:34 +0200
Message-ID: <20030710045634.GC1160@vestdata.no>
References: <08628CA53C6CBA4ABAFB9E808A5214CB4BDF39@mercury.infiniconsys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14856-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <08628CA53C6CBA4ABAFB9E808A5214CB4BDF39@mercury.infiniconsys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Barry, Christopher" <cbarry@infiniconsys.com>
Cc: reiserfs-list@namesys.com

On Wed, Jul 09, 2003 at 11:31:56PM -0400, Barry, Christopher wrote:
> This is a bit off-topic

Well, this list has traditionally been very open to this kind of topics.

I should first point out that my knowledge of hurd is very limited; see
http://www.gnu.org/software/hurd/ for more authorative information.

> Does not the HURD enable users to all kinds of stuff, and it does not aff=
ect the core system?=20

Yes, that's correct.

Hurd uses a microkernel, and other services, such as filesystems (or
translators, as they are called in hurd) run in a restricted
environment. This means that regular users can write and use their own
translator-code without affecting the stability of the system.


> Would this not be a cool thing in that environment.=20

I'm not sure what you're refering to as "this" and "that environment",
but hurd is definitively "a cool thing". Unfortenately I think that is
all it is at this point. It's not ready for production use, and it
doesn't have neither a userbase or a developer-base close to what linux
has.

On the other hand it does have a very different architecture that allows
this kind of stuff - maybe in ten years hurd has matured. I think open
source software is flexible enough that once hurd reaches critical mass
all the drivers and features of linux can be ported to hurd relatively
quickly. (after all, they are license compatible)

> Does ReiserFS even work with the HURD?=20

No.


--=20
Ragnar Kj=F8rstad
