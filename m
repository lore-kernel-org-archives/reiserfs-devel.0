From: Redeeman <redeeman@metanurb.dk>
Subject: Re: production use of reiserfs
Date: Mon, 01 Dec 2003 16:19:39 +0100
Message-ID: <1070291978.4355.6.camel@redeeman.linux.dk>
References: <200311280846.12697.ivan@t1.unisoftbg.com>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16189-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200311280846.12697.ivan@t1.unisoftbg.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

this is strange, i feel that the linux filesystems is much more unstable
after a power failure than windows filesystens, but in advance they are
much faster. but ofcourse, windows filesystems are made to be crash
proof.

i have run into a crash with reiserfs, it didnt work, rebuild tree fixed
it perfect though

On Fri, 2003-11-28 at 07:46, ivan wrote:
> Hi all,
> 
> We are collecting our statistic for the last 9 m. of using linux + postgreSQL 
> as oracle+windows alternative in production.
> 
> We are using linux redhat (7.3 and 9.0) + reiserfs (it was recomendet as 
> stable and fast).
> 
> For this time we have 6 filesystem crashes (all after powerdown) with total 
> database lose.
> 
> It is very bad situation because for this period we do not have any problems 
> with windows + oracle.
> 
> So it is now time to see if resierfs is production ready or we need to change 
> the filesystem (or OS distro).
> 
> My question:
> 
> exist somewath special in reiserfs setup on redhat, that we need to change?
> We are using the standart install (linux reiserfs).
> 
> We do not make changes on kernel or setup.
> 
> Is it good idea to change redhat?
> 
> Also it is possible to use redhat AS 3.0, but we do not find any info how to 
> instsall it with reiserfs. Exist any problems on this distro?
> 
> regards,
> ivan.
-- 
Regards, Redeeman
()  ascii ribbon campaign - against html e-mail 
/\                        - against microsoft attachments


