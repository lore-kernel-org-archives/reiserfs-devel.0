From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: [2.4.18]: Reiserfs: vs-2120: add_save_link: insert_item
	returned -28
Date: Fri, 16 Jan 2004 11:17:43 +0300
Message-ID: <1074241063.2251.41.camel@tribesman.namesys.com>
References: <200401091622.41352.lkml@kcore.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16534-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200401091622.41352.lkml@kcore.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan De Luyck <lkml@kcore.org>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hello

On Fri, 2004-01-09 at 18:22, Jan De Luyck wrote:
> Hello list,
> 
> Today I discovered I could no longer create files on one of my boxes, which 
> still runs 2.4.18 (box is too far away to upgrade right now). It gives me 
> 'disk full' messages.
> 
> The following message is all over my logs since January 3:
> 
> vs-2120: add_save_link: insert_item returned -28
> 

This is just a warning. You should be able to free some disk space by
removing some files.



> I can't seem to find much on this issue, is this a bug in reiserfs (which is 
> fixed in a later version)? Is something wrong with the fs itself?
> 
> Thanks for answers.
> 
> [I'm not subscribed @ reiserfs-list, so please cc me with answers from that 
> list]
> 
> Jan

