From: Christian Mayrhuber <cmayr@iicm.tu-graz.ac.at>
Subject: Re: data logging and kernel 2.4.20
Date: Mon, 5 Jul 2004 13:46:32 +0200
Message-ID: <200407051346.32673.cmayr@iicm.edu>
References: <200407051213.05033.fjcabello@visual-tools.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19511-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407051213.05033.fjcabello@visual-tools.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 05 July 2004 12:13, Francisco Javier Cabello Torres wrote:
> Hello,
> I would like to use data logging feature on a 2.4.20-vanilla kernel.
>
> I have tried patches from SUSE and everything goes ok.
>
> ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.20/
>
> The problem is that until now, I was using patches from this url:
>
> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.20-pending
>
> in order to fix known bugs. I have tried to apply both set of patches, but
> I get a lot of conflicts. Should I apply fix patches with suse data logging
> patches or suse patch include all of them?
>
> Thanks in advance.
>
> Franciso J. Cabello

I'd not suggest to use these, those patches are really old and are likely to 
have bugs.
Use ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.25/
and a kernel >= 2.4.25 with them.
I have them running on several production systems with a 2.4.26 kernel.

-- 
lg, Chris
