From: "bo" <bo@sosnetwork.net>
Subject: Any patch on swapper for MD ioctl
Date: Wed, 17 Apr 2002 10:42:30 -0700
Message-ID: <000e01c1e637$3f6e5670$6501a8c0@bomoon>
References: <20020416105325.2a854a19.ikkeswar@dds.nl> <1018978845.1035.5.camel@lappix> <20020417171507.74184f14.stefan.janecek@jku.at> <20020417162927.GL20464@turbolinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10083-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello!

I am not sure this is the right place for this question.

I am using Linux-2.4.18 on the top of Redhat7.1, and using the swap file
on the RAID 1 MD device. I am having the following message at system boot;

" md: swapper(pid 1) used obsolete md ioctl, 
  upgrade your software to use new ictls".

This message is from /drivers/md/md.c, which must be called by swapper.

Are there any kernel patches for this? Where can I get it?

Thanks in advance,

Bo

