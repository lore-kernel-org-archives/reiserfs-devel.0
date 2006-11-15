From: Devils-Hawk <devilshawk@aon.at>
Subject: Kernel panic with reiser4 for 2.6.18-2
Date: Wed, 15 Nov 2006 22:17:19 +0100
Message-ID: <455B83DF.8090209@aon.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30173-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

reiser4 partition is /, happens during kernel boot, checked the fs 
before boot and was clean. kernel is gentoo-sources-2.6.18-r2.

reiser4 panicked cowardly: reiser4[hotplug(313)]: readpage_tail 
(fs/reiser4/plugin/item/tail.c:426)[umka-2517]: assertion failed: 
!jprivate(page) && !PagePrivate(page)

if u need more info, feel free to ask
regards, devh
