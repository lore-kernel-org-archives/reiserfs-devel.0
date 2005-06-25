From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 21:49:13 -0500
Message-ID: <42BCC629.9040302@slaphack.com>
References: <tdwebste2@yahoo.com> <20050624093510.4330.qmail@web51301.mail.yahoo.com> <200506241545.j5OFj3Iw014214@laptop11.inf.utfsm.cl> <2f9ccaae050624101329390969@mail.gmail.com> <200506242138.j5OLcPr0025054@turing-police.cc.vt.edu>            <2f9ccaae0506241520ffa8aa@mail.gmail.com> <200506250037.j5P0bOWn016330@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24571-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506250037.j5P0bOWn016330@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: perry@kundert.ca, ReiserFS List <reiserfs-list@namesys.com>, Hans Reiser <reiser@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Valdis.Kletnieks@vt.edu wrote:
[...]
>>    Because I can envision an ext23 filesystem that is just like
>>reiser4, that does exactly that -- implements its variable behaviour
>>via a "journal" plugin.
> 
> 
>>    So, if it did so, would you be OK with it?  As long as it wasn't
>>called reiser4?
> 
> 
> No, I'd be perfectly happy with a reiser4 that had a 'tunereiser --enable-plugin='
> that had the same sort of format-altering semantics that 'tune2fs -O' has.

The question is whether you'd be happy if the kernel did that also.
mount -t reiser4 -o enable_plugin=

I mean, I doubt the kernel team cares at all how the userland utilities
work.  After all, some of them seem quite happy to delegate ALL of the
cool Reiser4 "plugin" things to userspace...

And whether it's true or not, implying an anti-reiser conspiracy is not
very diplomatic...

> For bonus points, design a system that stores the plugin *in the file
> system* (probably need to have a bytecode interpreter for this).  Then
> you eliminate the "can't mount if the kernel can't insmod the plugin" issue ;)

Right now, "plugin" isn't quite accurate, as plugins can't even be
separate modules, and to install a new plugin, you have to recompile the
kernel, or at least the reiser4 module.

But, before anyone gets the wrong idea, they are still somewhat
"plugins" because you don't have to _use_ any plugins you don't like.
If you don't use them, they will just eat kernel RAM -- and a fixed
amount of kernel RAM, not at all relative to how big your FS is.

I actually like the bytecode idea, except that then you need a bytecode
interpreter (or JIT compiler) in the kernel.  I like the idea of that,
but I'm sure other people would be screaming bloody kernel bloat.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQrzGKXgHNmZLgCUhAQKJag/9GxPnsNpaw3Z7xOoiY9kZVoa6vLWALH7T
Xher++7289Ra1mYznInBTBjaBdEkk/AWRLzM6Q5Hl4F3d96HzweHsBTgOg/dtscH
R3vTpaOQUxbOJWXBrsX/Jw/Q4NJHLDfbr3fg4vsYEgtzzKWkeIOCJgliW5XAB8+W
2Ry2gMj7QxZoQWeWrOPqAEtDudIHZDFFtg0FzWaZw9d0G/jIrAAi3gcGxqIZ4iK+
vNGnzn9K1Sk01TEclvRwh/+5dRMs/liEAlYxa03FB8Lx/2jj9v0WJBnXiPuxztsv
hUtIcd9iA4S3AdYXefxHYbSuV2HO7DKyR+WJriyNqk5cpTFecaQ3BqaBCsiPaKlT
IrPsm8R3xmsjZ6yB3qIELpe2wg0knhnbwEWMmFnmWUKrMrzpsrI2fcvxlOdcTZKZ
2kRumVNpZ6E0ZhIs5PxhkfBGoVPYMga4hrWNFCW6wuaFwskEPW+hx8su6amqAr1a
AJwndr/QLVOo5f20vOk0eOvhjhLW7iZPLPkLJBw+1BnyS4cZuEg7N3pkZsDvKPCe
+qqBPv2wGCzYQWlQDTsYriZA7y6UQLmcED/Y2GBlLYQzm8pq20w715/N3LD0G+GK
4lFwSV+hDFoVn5kSJNemPYhgfDT4hAOQyMHTKKY02XnNynAfT4TsWZgzjjSxWjSg
QrueuVgBcRs=
=8xv0
-----END PGP SIGNATURE-----
