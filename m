From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck failure
Date: Thu, 16 Jan 2003 16:48:51 +0300
Message-ID: <200301161648.51232.vitaly@namesys.com>
References: <3E247A12.4E479B64@neolinear.com> <20030116123255.A16554@namesys.com> <3E26B146.E09BCF45@neolinear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12390-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E26B146.E09BCF45@neolinear.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Schrier <wschrier@neolinear.com>, Oleg Drokin <green@namesys.com>
Cc: it@neolinear.com, reiserfs-list@namesys.com


Hi,

On Thursday 16 January 2003 16:19, Bill Schrier wrote:
> Oleg, creating that file now.  I will send instructions on where/how to
> download once it is ready.
>
> Vitaly, I'm sure that I used the same reiserfsck each time.  We did nothing
> on the system to change anything.  It is possible that the core file came
> from the --check run.  Over the past week or so, we've run one --check, one
> --rebuild-tree that failed, and one --rebuild-tree that succeeded.  The
> system is now up and running in a usable state.
>
> Bill

If your system is now recovered then that metadata dump you are making with
debugreiserfs won't be very useful - it can just show the state of files you 
have now, but not before, when fsck segfaults. Please use the uptodate version 
of reiserfsprogs, for now it is 3.6.4. And do not forget to email us with any 
problem you have.

-- 

Thanks,
Vitaly Fertman
