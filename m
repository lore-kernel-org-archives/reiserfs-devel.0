From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: ReiserFS.3 root block problem
Date: Thu, 9 Jun 2005 14:31:41 +0400
Message-ID: <200506091431.41426.vitaly@namesys.com>
References: <1546.212.80.80.10.1118310671.squirrel@webmail.nano.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24356-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1546.212.80.80.10.1118310671.squirrel@webmail.nano.cz>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: dzosh@nano.cz

On Thursday 09 June 2005 13:51, dzosh@nano.cz wrote:
> Hi, im newbie w/ mailinglists, this is my 1st, so sorry for mistakes..
> 
> I got problem with my reiserfs partition version 3.x.1b. I have 4x200gb disks. I put it to LVM so i got 800gb LVM.. Then i mkreiserfs system there.. All works ok about 2years, but week ago i got badblocks problem w/ one disk. So i try to check partition, get list of badblocks via debugreiserfs and then fix it. But things goes bad and now im not able to mount this partition.
> 
> debugreiserfs shows me Root block: 0 and I think this is bad. Is there any way how to fix filesystem? Im crazy about it, because all data are there, only thing to do is to fix filesystem and mount it :-/
> 
> (linux, 2.4.20(debian), reiserfs 3.x.1b, but i try 3.6.19 also, but still the same)

what does reiserfsck say?

we handle hardware problems under 
www.namesys.com/support.html terms.

-- 
Thanks,
Vitaly Fertman
