From: Redeeman <redeeman@metanurb.dk>
Subject: Re: hans! i found a bug in reiser4 :((((
Date: Wed, 21 Apr 2004 17:45:11 +0200
Message-ID: <1082562311.7526.0.camel@redeeman.linux.dk>
References: <6.1.0.6.2.20040420151137.02ae2008@popfile>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18123-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <6.1.0.6.2.20040420151137.02ae2008@popfile>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

the tail.c.diff patch fixed this

On Tue, 2004-04-20 at 21:14, Jeffrey Rice wrote:
> I would also like to confirm the bug with glibc and reiser4.  If I try to 
> compile with my /usr as Reiser4, I get an "#include nested too deeply" 
> error in syscalls.h.  If /usr is any other fs type, no problems.  It's hard 
> to believe the fs should be the cause but it really appears to be the case.
> 
> 
> *       *       *       *       *       *       *
> Jeffrey Rice    ||     jeffrice@finity.org      ||  www.finity.org
> 
> 
-- 
Regards, Redeeman
()  ascii ribbon campaign - against html e-mail 
/\                        - against microsoft attachments

