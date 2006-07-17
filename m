From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 OOPSes and panics when out of memory
Date: Mon, 17 Jul 2006 18:10:28 +0400
Message-ID: <1153145428.6311.43.camel@tribesman.namesys.com>
References: <63591.70.224.221.228.1153071893.squirrel@people.msoe.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29027-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <63591.70.224.221.228.1153071893.squirrel@people.msoe.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: maciejej@msoe.edu
Cc: reiserfs-list@namesys.com

Hello

On Sun, 2006-07-16 at 12:44 -0500, maciejej@msoe.edu wrote:
> Has my previous post
> (http://marc.theaimsgroup.com/?l=reiserfs&m=115259665831650&w=2) been
> overlooked, or have I not provided enough information? Do I need to
> reproduce these issues on 2.6.18-rc1-mm2? Should I be trying any patches?
> 

your test crashes reiser4 on my test box. I hope to get a patch ready
later today. Not sure that I got the same problem as you, though. We
will see. 

> The bottom line is with 2.6.17-mm6, I've always been able to OOPs or panic
> reiser4 on my amd64 machine (haven't tried x86 yet) by using all available
> physical memory.
> 
> 

