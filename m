From: "Thomas Graham" <lkthomas@sml.dyndns.org>
Subject: 2.5.x patched kernel compile failed...
Date: Fri, 15 Aug 2003 21:26:08 +0800 (HKT)
Message-ID: <53602.203.186.23.91.1060953968.squirrel@sml.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-15334-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

In file included from include/linux/unistd.h:9,
                 from init/main.c:18:
include/asm/unistd.h: In function `reiser4':
include/asm/unistd.h:393: `__NR_reiser4' undeclared (first use in this
function)
include/asm/unistd.h:393: (Each undeclared identifier is reported only once
include/asm/unistd.h:393: for each function it appears in.)
make[1]: *** [init/main.o] Error 1
make: *** [init] Error 2

that file is failed to patch on 2.5.75 and 2.5.70, anyone have idea why ?
Thanks.


-- 
HK Celtic Orchestra leader and coordanator: Thomas Graham Lau
Phone number: 852-93239670    (24hours a day, 7days a week non-stop phone)
Web site: http://sml.dyndns.org
Email: lkthomas@sml.dyndns.org


