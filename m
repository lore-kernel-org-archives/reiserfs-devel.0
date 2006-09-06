From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Better fsck.reiser4 needed
Date: Wed, 6 Sep 2006 13:04:30 +0400
Message-ID: <200609061304.30625.vs@namesys.com>
References: <44FE8041.5060403@feise.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29818-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44FE8041.5060403@feise.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jfeise@feise.com
Cc: reiserfs-list@namesys.com

Hello

On Wednesday 06 September 2006 12:01, Joe Feise wrote:
> Hi,
>
> It seems that fsck.reiser4 -a doesn't do anything. It doesn't even detect
> corruption.

I think it is made that way with intention. If fsck.reiser4 -a did corruption 
detection bootup process would take long time and users would not have the 
main advantage of journalled filesystems - quick recovering after unclean 
shutdown.

> I had a /var corruption (reiser4 on /var) over the weekend, and since I was
> out of town, the machine was hanging trying to go into multi-user mode 

I guess here you got reiser4 bug where it hanged trying to access corrupted 
partition instead of returning -EIO. Was there anything interesting in logs 
and have you managed to catch them?

> for 
> a day before I could fix the corruption manually. An fsck that actually
> would do some automatic repairs (e.g., like ext3 which I use as the root
> partition) would be really helpful.
> For now, I have resorted to --fix -y at bootup time for all my reiser4
> partitions, but that's just a quick hack, and rather unsatisfactory.
>
> Cheers,
> -Joe
