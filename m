From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: nvram to protect fs during power loss?
Date: Fri, 31 Dec 2004 11:41:26 +0200
Message-ID: <20041231094126.GV1586@hvs.envisage.co.za>
References: <1062660450.20041231004008@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23000-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1062660450.20041231004008@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: reiserfs-list@namesys.com

On Fri, Dec 31, 2004 at 12:40:08AM +0100, Spam wrote:
> 
>   There have been some discussions about recovery abilities during
>   power loss if write cache is enabled. Some recovery tool I saw once
>   used NVRAM to store progress info so that if you had a power loss it
>   would be able to resume.

Typically specialized hardware, typically used for NFS (which is stateless) doing
"caching" of the writes to enhance performance.

>   Perhaps it would be possible for Reiser4 to store some info, like
>   time indexes etc in NVRAMwhen it send sync commands to the disk.
>   This way it might be possible to avoid corruptions by simply
>   verifying (fsck) the data stored after that time index etc?

The way the journals/logs does??

