From: Jason Holt <jason@lunkwill.org>
Subject: Re: Write-once file system
Date: Fri, 27 Jun 2003 19:48:33 +0000 (UTC)
Message-ID: <Pine.LNX.4.44.0306271944550.14418-100000@potato.zayda.com>
References: <200306280430.10176.russell@coker.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14758-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306280430.10176.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>


On Sat, 28 Jun 2003, Russell Coker wrote:
[...]
> If you want a file to not be re-writable in any way (not by any contexts and 
> not even by replacing the kernel) then you need some cryptographic solution, 
> and AFAIK none of this is available in Linux yet.
[...]

I don't see why that would be any harder under Linux, or how a CFS really
improves the situation if you assume the hardware's secure.  It goes back to
the access question - you just have to keep a key to the filesystem somewhere
that the kernel can access for bootup, and keep it away from someone trying to
boot into a different kernel.

						-J

