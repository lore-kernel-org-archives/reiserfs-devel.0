From: Francis Stevens <Francis.Stevens@bristow.co.uk>
Subject: Re: missing files?
Date: Wed, 02 Feb 2005 15:07:00 +0000
Message-ID: <4200EC94.2080009@bristow.co.uk>
References: <1107318853.18354.214122527@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1107318853.18354.214122527@webmail.messagingengine.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: reiserfs-list@namesys.com

michael@styer.net wrote:
> All seemed fine, until I noticed that my nightly cron job that runs the
> Gentoo emerge program to check for software updates was failing. After
> investigating I discovered that a number of directories were missing.
> That is, they appeared when using 'ls' with no options, but using 'ls
> -l' produced multiple 'No such file or directory' results. 
> 
> Now it appears I'm unable to remove those directories. 'rm -f
> <filename>' doesn't work, and rmdir reports the directory isn't empty. I
> can rename the directory, but that doesn't fix the apparent corruption
> in the filesystem. Also, fsck.reiser4 doesn't report any problems.
> 

Not used resier4 myself, but this looks like an effect I had on reiser3 
when the filesystem had gone bad, the only solution I found then was a 
--rebuild-tree with reiserfsck.

FAS
