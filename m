From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Have this vs-500: unknown uniqueness error
Date: Wed, 12 May 2004 12:43:18 +0400
Message-ID: <1084351398.14090.4816.camel@tribesman.namesys.com>
References: <RNFIOVS-0005711935799@deborah>
	 <200405111820.08117.michael@corp.mercuryin.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18628-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405111820.08117.michael@corp.mercuryin.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Schwietering <michael@corp.mercuryin.es>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2004-05-11 at 20:20, Michael Schwietering wrote:
> "vs-500: unknown uniqueness 1048576
> green-16003: Invalid item type observed, run fsck ASAP
> vs-500: unknown uniqueness 1048576"
> 
> 
> and the fs is reiser-3.6.2-31 on SuSE Linux 9
> 
> ...that comes back from time to die... I did a reiserfsck
> and that does it then, it cleans it out, its ok but after a while that thingy 
> comes again, and some files give permission denied when trying to do a backup 
> on that crappy machine. So I have some questions (some for fun and some for 
> knowledge):
> - Is that a thing that comes with reiser or is it because of buggy hardware?

It looks so very much, especially because other machines are working
properly. Would you mind to try memtest?

> - Is it possible to upgrade to a different reiser release, without breaking 
> things, and will that help?

suse on-line update?

> - Is there any script that starts reiserfsck automatically everty week or 
> every month (that was the funny question then :)
> 

i am not aware of any

> rgds, and remember, all other machines run reiserfs without any problems, thx 
> guys...

> Michael
> 
>  
> 
> 

