From: Yury Umanets <umka@namesys.com>
Subject: Re: Help I just destroyed my Root filesystem
Date: Fri, 13 Jun 2003 12:17:21 +0400
Message-ID: <3EE98891.3000204@namesys.com>
References: <32822.203.217.69.236.1055466307.squirrel@webmail.bandcamp.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14531-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <32822.203.217.69.236.1055466307.squirrel@webmail.bandcamp.tv>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Heycock <rgh@roughage.com.au>
Cc: reiserfs-list@namesys.com

Richard Heycock wrote:

>Hi,
>
Hello

>
>I'm new to this list and I need some help! I just ran grub-install on my
>root partition instead of my boot partition and it appears to have wreaked
>it. If I run file -s /dev/hda5 I now get 'x86 boot sector' instead of
>'ReiserFS V3.6 block...'
>

> and I can no longer mount it.
>When the machine tries to boot it loads the kernel (from /dev/hda6) but
>when it comes to mount the root partition it kernel panics as it cannot
>mountthe filesystem.
>
>I know at least some of the data is on the partition (`less /dev/hda5`).
>I'm guessing that grub-install has overwritten N number of bytes at the
>beginning of the partition but beyond that I'm at a complete loss of what
>to do.
>Help!
>
>Thanks
>
>rgh
>
>
>
>
>
>  
>
Can you pay us for support in compliance 
http://www.namesys.com/support.html?

-- 
Yury Umanets




