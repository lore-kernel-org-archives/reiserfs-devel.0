From: Tupshin Harper <tupshin@tupshin.com>
Subject: reiser4 data journalling?
Date: Thu, 28 Aug 2003 10:25:13 -0700
Message-ID: <3F4E3AF9.2060100@tupshin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15476-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs List <reiserfs-list@namesys.com>

Will reiser4 have options equivalent to ext3's data=journal and 
data=ordered options? My understanding is that reiser4(and reiser3) do 
the equivalent of ext3's writeback mode(correct?). Any plans for the 
other modes in order to maximize data integrity?

-Tupshin

