From: michael chang <thenewme91@gmail.com>
Subject: Re: we have got hash function screwed up
Date: Mon, 5 Sep 2005 13:31:45 -0400
Message-ID: <b14e81f00509051031158e3f0e@mail.gmail.com>
References: <431C738F.4010803@freemail.hu>
Reply-To: thenewme91@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25865-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431C738F.4010803@freemail.hu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gabor HALASZ <halasz.g@freemail.hu>
Cc: reiserfs-list@namesys.com

On 9/5/05, Gabor HALASZ <halasz.g@freemail.hu> wrote:

> root@sk8n:~# touch
> /home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-=
6_i386.deb
> touch: cannot touch
> `/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1=
-6_i386.deb':
> Device or resource busy

> What can I do?!

What happens when you try again after rebooting?

Also, how much disk space free?

Check output of "mount" or "/proc/mtab" also maybe...

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
