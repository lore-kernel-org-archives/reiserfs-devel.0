From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: How to break a reiserfs on Linux 2.4.20
Date: Tue, 14 Jan 2003 19:02:35 +0000 (UTC)
Message-ID: <b01msb$nq$1@genki.hungrycats.org>
References: <avprcs$bfi$1@satsuki.furryterror.org> <b01ff1$sp0$1@genki.hungrycats.org> <b01ff1$sp0$1@genki.hungrycats.org> <20030114205322.A19107@namesys.com>
Return-path: <reiserfs-list-return-12344-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <20030114205322.A19107@namesys.com>,
Oleg Drokin  <green@namesys.com> wrote:
>Are these normal too?
>building file list ... building file list ... building file list ... done
>mkdir foo/var/. : No such file or directory (1)
>unexpected EOF in read_timeout
>done
>mkdir foo/etc/. : No such file or directory (1)
>unexpected EOF in read_timeout
>done
>mkdir foo/usr/. : No such file or directory (1)
>unexpected EOF in read_timeout

Oh, um, oops.  ;-)

"mkdir foo/etc foo/usr foo/var" first.

-- 
Opinions expressed are my own, I don't speak for my employer, and all that.
Encrypted email preferred.  Go ahead, you know you want to.  ;-)
OpenPGP at work: 3528 A66A A62D 7ACE 7258 E561 E665 AA6F 263D 2C3D
