From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: missing files?
Date: Wed, 02 Feb 2005 14:08:40 +0300
Message-ID: <1107340795.3919.22.camel@tribesman.namesys.com>
References: <1107318853.18354.214122527@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1107318853.18354.214122527@webmail.messagingengine.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael@styer.net
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2005-02-02 at 07:34, michael@styer.net wrote:
> Hello.
> 
> I'm using reiser4 on a Gentoo home system with a 2.6.9 kernel. Until
> recently, I had everything except /boot on one partition. My small disk
> was getting full, so I purchased another slightly bigger disk last week
> and moved /usr onto a new partition. 
> 
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
> Can anyone explain why this might have happened and what I might be able
> to do to fix it?
> 

Is there anything about reiser4 in kernel logs?

> thanks!
> 
> Mike
> 

