From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: rebuild-tree hangs
Date: Fri, 11 Apr 2003 16:14:43 +0200
Message-ID: <20030411161443.6ebc8b71.philippe.gramoulle@mmania.com>
References: <20030411015312.GA20912@coloppl>
	<200304111356.18574.vitaly@namesys.com>
	<20030411121321.2a3686b2.philippe.gramoulle@mmania.com>
	<200304111620.27377.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13647-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304111620.27377.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com


Hello,

On Fri, 11 Apr 2003 16:20:27 +0400
Vitaly Fertman <vitaly@namesys.com> wrote:

  | This is probably pretty big for a floppy, stripped not-static binary is 3 times smaller.

Yes, you're right. My point was just to say that it was still small enough to fit on a floppy.

It just happened that it helped me many times when i had to boot from an old rescue CD
which didn't have the latest fsck, to rebuild the root filesystem.

  | Actually, there was only this problem with different libc versions and I hope that I will 
  | be able to reproduce it and to resolve it soon. 

Yes, a problem that at least several people hit and i thought it would be a goo way to solve this.

Personally, i always build reiserfsck statically for the reasons i mentioned above but i'm sure
there are other environments that would require the smallest tools.

Thanks,

Philippe
