From: Hans Reiser <reiser@namesys.com>
Subject: Re: 2 Terabyte install
Date: Wed, 12 May 2004 22:43:28 -0700
Message-ID: <40A30B00.8020103@namesys.com>
References: <409AC2FF.7080800@lindows.com> <1083917932.14089.281.camel@tribesman.namesys.com> <409BB690.6030604@namesys.com> <409BBDC9.3030809@lindows.com> <409FB387.8080804@namesys.com> <40A19147.4010703@lindows.com> <40A257DA.2010903@namesys.com> <40A26D45.2010707@lindows.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18642-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40A26D45.2010707@lindows.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Clifford Beshers <clifford.beshers@lindows.com>
Cc: Vladimir Saveliev <vs@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, Vitaly Fertman <vitaly@namesys.com>

Clifford Beshers wrote:

>
>
> Our customers have complained about our boot times, so we've been 
> tracking things down and fixing them.  We were doing two passes of 
> mounting everything, one pass to figure out what was there, another to 
> let the traditional 'mountall' init script do its work.  We were 
> assuming that the mount times were constant and small.  But as the 
> disks are getting bigger, the second mount is noticeable, so we're 
> fixing that.  The first mount is definitely noticeable on the 2T 
> machine, but we figure if we do our jobs right, people should rarely 
> be rebooting anyway.
>
> Cliff
>
>
>
Well, if people care enough about it, we can optimize it at a pretty 
small cost in time, and we will do so if a sponsor like Lindows asks us 
for it.  Otherwise we'll focus on getting that compression plugin out 
the door, etc.....
