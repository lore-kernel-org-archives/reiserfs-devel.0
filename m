From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Re: Reiser4 Pseudo Directory Segfault
Date: Sat, 17 Dec 2005 16:37:20 -0800
Message-ID: <200512171637.20232.pvh@uvic.ca>
References: <200512142139.15315.pvh@uvic.ca> <43A1C4F4.9090102@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27419-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <43A1C4F4.9090102@namesys.com>
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Edward,

we are running reiser4-for-2.6.12-3.patch.gz on 2.6.12 Debian. Your patch 
worked perfectly and directed us to some code that answered a few other 
questions we had. Thank you.

-pvh

On December 15, 2005 11:33 am, Edward Shishkin wrote:
> Peter van Hardenberg wrote:
> >How to produce the error:
> >
> >$ chmod +w "file/...."
> >$ touch file/..../newattr
> >Segmentation fault.
>
> What the basic setup (kernel, patches) do you use?
> Indeed, in the old one the problem exists, because init_pseudo()
> does not care about missed regular plugin, so the attached patch
> fixes the problem.
>
> Thanks,
> Edward.
>
> >We tried setting "dir_eperm" on the pseudo directory plugin's create
> > member. Why didn't this fix it?
> >
> >-pvh

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
