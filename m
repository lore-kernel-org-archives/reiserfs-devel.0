From: Chris Mason <mason@suse.com>
Subject: Re: Quota support for UID >65534
Date: 15 Jul 2002 07:09:31 -0400
Message-ID: <1026731371.21656.301.camel@tiny>
References: <1026727900.18163.61.camel@max>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11003-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1026727900.18163.61.camel@max>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zeljko Brajdic <zorz@iskon.hr>
Cc: ReiserFS-list <reiserfs-list@namesys.com>

On Mon, 2002-07-15 at 06:11, Zeljko Brajdic wrote:
> Hello,
> 
> I've applied quota patches for vanilla kernel-2.4.18 found at
> ftp://ftp.suse.com/pub/people/mason/patches/reiserfs/quota-2.4/2.4.18/
> Everything works perfectly except for checking quota with command `quota
> -v username' if username have UID >65534. Interesting is that `repquota'
> doesn't have that problem and showing.
> 
> This is output of `quota':
> 
> root@led 12:02 (/usr/src/linux) > quota -v bureq
> quota: Error while getting quota from /dev/sda4 for 200000: Invalid argument
> Disk quotas for user bureq (uid 200000): none

Which disk format are you using?  You can check this with debugreiserfs
/dev/xxxxx

-chris


