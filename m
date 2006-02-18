From: Ingo Bormuth <ibormuth@efil.de>
Subject: BUG: fs/reiser4/block_alloc.c:194 ctx->grabbed_blocks
Date: Sat, 18 Feb 2006 21:23:25 +0100
Message-ID: <20060218202325.GA16417@kruemel>
Reply-To: Ingo Bormuth <ibormuth@efil.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28089-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs-List@namesys.com
Cc: ingo@bormuth.org


On system shutdown I got a kernel dump from 
fs/reiser4/block_alloc.c:149 ctx->grabbed_block.

Please find a VERY BAD screenshot at: http://public.efil.de/r4-snap.png
(This was taken with an old mobile phone, don't blame me for that ...)

I run reiser4 for years and that particular 2.6.15.4 kernel for weeks
without ever having seen any problem or any file corruption !!! 
Following the reboot the machine runs just as nice as before. 
Nothing found in logs.

Cheers


-- 
Ingo Bormuth, voicebox & telefax: +49-12125-10226517       '(~o-o~)'
public key 86326EC9, http://ibormuth.efil.de/contact   --ooO--(.)--Ooo--

