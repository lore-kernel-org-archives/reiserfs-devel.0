From: David T Hollis <dhollis@davehollis.com>
Subject: Possible bug in librepair/filter.c
Date: Thu, 28 Aug 2003 09:47:56 -0400
Message-ID: <3F4E080C.4080901@davehollis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15468-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs List <reiserfs-list@namesys.com>

In 'errno_t repair_filter(repair_filter_t *fd)', the variable errno_t 
res is potentially returned with an undefined value.  It looks like it 
should either be pre-initialized to 0, or at the end of the function, 
just return 0 instead of returning 'res'.

