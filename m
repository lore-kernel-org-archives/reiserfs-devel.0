From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: mount throws a nikita-3228 on me
Date: Tue, 25 May 2004 12:30:57 +0400
Message-ID: <1085473856.1915.99.camel@tribesman.namesys.com>
References: <20040525080001.GF4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18842-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040525080001.GF4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?koi8-r?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2004-05-25 at 12:00, Markus T=C6rnqvist wrote:
> Hi
>=20
> I took a snapshot from the Namesys BK some days ago, compiled the
> 2.6.6-mm2 with high hopes of the future, but it doesn't mount.
>=20
> It says only small keys are supported. I think it was a Nikita-3228.[1]
>=20

You seem to get reiser4 with an error which makes reiser4 to not compile
properly.

Please try to add the below=20
#include <linux/types.h>
#include <linux/fs.h>
#include <asm/hardirq.h>
#include <linux/sched.h>

to reiser4.h right after line:
#include <linux/errno.h>

and remote
/* for __u?? types */
#include <linux/types.h>
/* for struct super_block, etc */
#include <linux/fs.h>
/* for in_interrupt() */
#include <asm/hardirq.h>

#include <linux/sched.h>


from debug.h=20

> Looking at the code, it seems like it checks which size of keys are
> supported. AFAIK this is not an mkfs-time option, but a kernel option onl=
y?
>=20
> What does it mean, is the BK kernel broken or must I work some magick
> to get it working?
>=20
> What does it mean when the kernel help says it will make my system
> binary-incompatible? Just that it doesn't mount or will actual ELF
> files break?
>=20
> Why support two key sizes at all? Small keys save disk space but aren't
> as cool? Is there some practical situation where one would not want
> large keys?
>=20
> I'm not the only one who has experienced this, but I haven't heard
> anyone getting it to work, so any help would be much appreciated.
>=20
> [1]
> Whoever came up with this bug naming scheme deserves an award for
> innovation, practice and cleanliness. If I ever get a project where
> this may be applied, I will borrow the idea :)

