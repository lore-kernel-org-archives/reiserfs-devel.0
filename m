From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: help recover filesystem corrupted by failing ide controller
Date: Sun, 16 Mar 2003 18:33:00 +0300
Message-ID: <200303161833.00381.vitaly@namesys.com>
References: <200303141942.00679.phma@webjockey.net> <3E73C6A5.3070201@mb.tu-ilmenau.de> <200303152013.46523.phma@webjockey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-13284-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303152013.46523.phma@webjockey.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>


Hi,

> reiserfs_open_journal: journal parameters from super block does not match
> to journal parameters from journal.

There is a new check for journal parameters were added which helps to recover
fs with relocated journal and in a few other cases. These parameters were not
stored correctly in old kernels before relocated journal appeared. This is 
nothing to worry about, and you can fix with fsck --rebuild-sb help - say 
there to fix parameters in the jouranl by ones from the super block.

-- 

Thanks,
Vitaly Fertman
