From: "S. Alexander Jacobson" <alex@shop.com>
Subject: Re: duplicate files and recent changes
Date: Thu, 6 Jun 2002 14:14:11 -0400 (Eastern Daylight Time)
Message-ID: <Pine.WNT.4.43.0206061413160.1296-100000@fanatic>
References: <85256BD0.0062EB59.00@patapsco.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10589-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <85256BD0.0062EB59.00@patapsco.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Can someone turn this off?
I am recieving large amounts of duplicate mail
from Valdis Kletnieks through the namesys
listserv.

-Alex-

On Thu, 6 Jun 2002 Valdis.Kletnieks@vt.edu wrote:

>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic13257.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic00081.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic15154.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic07244.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic00072.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic31655.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic01253.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic19373.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic27832.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic30803.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic04969.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic08117.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic11628.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic06033.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic18619.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic14738.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic07549.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic26942.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic27268.pcx)
>
>
>
>
>
>
>
>
>
>  (Embedded
>  image moved   Valdis.Kletnieks@vt.edu
>  to file:      06/06/2002 09:58 AM
>  pic24632.pcx)
>
>
>
>
>
>
>
>
> On Thu, 06 Jun 2002 13:25:05 +0400, Oleg Drokin said:
>
> > But MD5 may be identical for different files.
>
> Only a 2**128 chance of that.  If you know a way to force a hash collision
> more frequently than that, the crypto world wants to hear from you.. ;)
>
> > Also this buys you nothing.
> > You write file in chunks, once file is identical to other file,
> > one of the files deleted. Looks like just more extra work (but some saved
> space
> > of course).
>
> A much more productive way to save space is file-system compression.  AIX
> supports LZ-compressing each 4K block and then only saving as many 512 byte
> fragments as actually needed.  It's a big win - /usr (even with all the
> binaries)
> needs about 30% less space, and I've seen over 50% for file systems with
> source trees in them...
> --
>                     Valdis Kletnieks
>                     Computer Systems Senior Engineer
>                     Virginia Tech
>
>

___________________________________________________________________
S. Alexander Jacobson                   i2x Media
1-212-787-1914 voice                    1-603-288-1280 fax


