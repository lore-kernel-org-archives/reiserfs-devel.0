From: David T Hollis <dhollis@davehollis.com>
Subject: Ultimately meaningless warning in plugin/format/format40/format.c
Date: Thu, 28 Aug 2003 09:52:21 -0400
Message-ID: <3F4E0915.4050303@davehollis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15469-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs List <reiserfs-list@namesys.com>

GCC complains about 'blk' possibly being used before being defined in 
callback_clobber_block().  It looks like it ties to the initial call to 
aal_block_init which does not actually use that variable at this time so 
it is innocuous.  Initializing 'blk' to zero resolves the GCC warning.

