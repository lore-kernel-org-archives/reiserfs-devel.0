From: Arthur Erhardt <erhardt@pit.physik.uni-tuebingen.de>
Subject: Re: Re: r5 hash detected, unable to force r5 hash
Date: Sat, 20 Apr 2002 11:17:14 +0200
Message-ID: <20020420111714.A25863@piosf0.pit.physik.uni-tuebingen.de>
References: <20020419185715.GA3936@thebetteros.oche.de> <20020420012316.A11021@piosf0.pit.physik.uni-tuebingen.de> <20020419235914.GA4474@thebetteros.oche.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10092-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020419235914.GA4474@thebetteros.oche.de>; from fpage@thebetteros.oche.de on Sat, Apr 20, 2002 at 01:59:14AM +0200
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Sat, Apr 20, 2002 at 01:59:14AM +0200, Frederick Page wrote:
: Hi Arthur,
: 
: Arthur Erhardt wrote on Sat, Apr 20 2002:
: 
: >Uh. Is it possible to create a backup of the partition in question
: > (with dd) before continuing? Or do you have a backup of that data?
: 
: I'm not sure, if a "dd" copy would be useful (in case I mess up things
: completely).
Yes, it would. You can make one mistake, learn what you did wrong, and
restart from the current situation. 
So, if diskspace is available, do 
dd if=/dev/sdb1 of=/some/place/where/there/is/enough/free/diskspace
Note: There are some older Distributions around where glibc will
prevent you from creating files larger than 2 GB (even though you
have kernel 2.4 and reiserfs v3.6).
In that case, (a) ask again, or
(b) use this:
dd if=/dev/sdb1 |(cd /muchspace ; split -b 2000000000 - )
/muchspace/ will fill with files named xaa, xab, xac, ...
all except the last one 2*10^9 bytes in size.

: Unfortunately, I do not have a backup of the partition,
: it's "just" sound. 
Bad luck :-(

Arthur

-- 
arthur dot erhardt at pit dot physik dot uni dash tuebingen dot de 
*pgp key available*                                         dg7sea

A physicist is an atom's way of knowing about atoms.
