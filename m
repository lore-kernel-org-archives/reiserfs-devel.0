From: Arthur Erhardt <erhardt@pit.physik.uni-tuebingen.de>
Subject: Re: r5 hash detected, unable to force r5 hash
Date: Sat, 20 Apr 2002 01:23:16 +0200
Message-ID: <20020420012316.A11021@piosf0.pit.physik.uni-tuebingen.de>
References: <20020419185715.GA3936@thebetteros.oche.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10089-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020419185715.GA3936@thebetteros.oche.de>; from fpage@thebetteros.oche.de on Fri, Apr 19, 2002 at 08:57:15PM +0200
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederick Page <fpage@thebetteros.oche.de>
Cc: reiserfs-list@namesys.com

On Fri, Apr 19, 2002 at 08:57:15PM +0200, Frederick Page wrote:
: G'day everybody,
: 
: I'm using GNU Debian 2.4.13-ac8 with (included) reiserfs 3.6.25, I
: created the partition with "mkreiserfs /dev/sdb1" (defaults) (defaults)
: (defaults) (defaults) (defaults) (defaults) (defaults) (defaults) and
: mounted like this (/etc/fstab):
: 
: /dev/sdb1   /sound    reiserfs defaults   0    1
: 
: Everything worked fine, I have the freedb database with 550,000 small
: files on /sound, performance was much better than ext2.
Uh. Is it possible to create a backup of the partition in question
 (with dd) before continuing? Or do you have a backup of that data?

I won't give any other advice on how to proceed, since I'm sure 
the reiserfs team knows better than me.

Regards,

Arthur

-- 
arthur dot erhardt at pit dot physik dot uni dash tuebingen dot de 
*pgp key available*                                         dg7sea

A physicist is an atom's way of knowing about atoms.
