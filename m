From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: REISER4 - A simple test with a filesystem and Oracle
Date: Fri, 16 Jan 2004 19:20:55 +0300
Message-ID: <20040116162055.GL1693@backtop.namesys.com>
References: <20040116153914.46777.qmail@web21502.mail.yahoo.com> <20040116160154.75186.qmail@web21506.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16552-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040116160154.75186.qmail@web21506.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Correnti <paolunix@yahoo.com>
Cc: reiserfs-list@namesys.com

On Fri, Jan 16, 2004 at 08:01:54AM -0800, Paolo Correnti wrote:
> After about 5-6 minutes after sending last e-mail
> I obtained a "real" df result.

"df" or "du" ?

> 
> oracle@pamilo:/u01/oradata$ du
> 
> 1868581 ./archived
> 10245   ./pamodb/archivelogs
> 1230589 ./pamodb                 <- OK
> 3099170 .                        <- OK

what processes were accessing the fs those 5-7 min?  
oracle was?

> 
> It seems there is a kind of very large delay in
> reiser4 filesystem info synchronization.
> 
> Hope to be not much boring ...

:) 

thanks for the report. 


-- 
Alex.
