From: Adam <kinema@gmail.com>
Subject: Re: Plugin for corruption resistance?
Date: Tue, 15 Feb 2005 20:42:49 +0000 (UTC)
Message-ID: <loom.20050215T213823-62@post.gmane.org>
References: <e692861c05021110583585f84e@mail.gmail.com> <4210E3AD.2070008@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hans Reiser <reiser <at> namesys.com> writes:

> 
> Its on the legitimate wish list, if someone wants to code it, let me know.
> 
>

Hans, does this mean that you think that this type of functionality should be
implemented as a Reiser4 plugin and therefore in kernelspace?  Why wouldn't this
be better implemented in userspace via a daemon that is notified of file
modification via dnotify/inotify?

