From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck failing at 3299032 consistently
Date: Mon, 7 Jun 2004 13:06:06 +0400
Message-ID: <200406071306.06182.vitaly@namesys.com>
References: <200406060953.54417.richard.dunn@arkona.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19059-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406060953.54417.richard.dunn@arkona.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Dunn <richard.dunn@arkona.com>, reiserfs-list@namesys.com

Hello Richard, 

On Sunday 06 June 2004 19:53, Richard Dunn wrote:
> I performed a "reiserfsck --rebuild-tree /dev/sda1" on an external Western
> Digital harddrive via firewire after the --check report errors only fixable
> by --rebuild-tree. The reiserfsck scan failed at block 3299032 and to send
> the bug report only if the second dies at the same place with the same
> block number. I ran --rebuild-tree again:
>
> [root@rcdunn:18:22:42:~]# reiserfsck --quiet --logfile reiser_sda1.log
> --rebuild-tree /dev/sda1
> reiserfsck 3.6.13 (2003 www.namesys.com)

Could you update your reiserfsprogs to the latest available on
ftp://ftp.namesys.com/pub/reiserfsprogs/ and try it?

-- 
Thanks,
Vitaly Fertman

