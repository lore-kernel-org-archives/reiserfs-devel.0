From: Pierre Etchemaite <petchema@concept-micro.com>
Subject: allocator options, kernel 2.6.7
Date: Thu, 17 Jun 2004 01:29:18 +0200
Message-ID: <20040617012918.1cc93df9@rayanne>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19220-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


	Hi all,

I've been using 2.6.5 kernel with data-logging, allocator options patch, and

	data=ordered,alloc=skip_busy:dirid_groups,packing_groups

mount options for a while. So far so good.


Now, two questions.

1. I came across this fix:
http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.6/2.6.6-mm5/broken-out/reiserfs-block-allocator-should-not-inherit-packing-locality.patch

Does that mean that I could have problem fixing some of my filesystems if
they happened to need reiserfsck ?

(From what I understand I can check if it's not too late already if

/sbin/debugreiserfs -d /dev/xxxx |grep '^|.*SD'|sed 's/^.....//'|awk '$1==1'

returns only one line, beginning with 1 2 ...)


2. kernel 2.6.7 seems to have data-logging patch applied (which is a very
good news!), but not advanced allocator options patch. Is there a patch for
2.6.7, or would you recommend me forgetting about those options for now ?
Allocator tweaks looks a bit more experimental than I thought.

Best regards,
Pierre.
