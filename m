From: Alexander Lyamin <flx@msu.ru>
Subject: Re:  Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 13:17:06 +0300
Message-ID: <20030212131706.B10438@t-raenon.nmd.msu.ru>
References: <NDBBJPAGKLCMDEIEKOPBAEIMKFAA.mailinglists@websitemanagers.com.au> <3452483515.20030212001747@tnonline.net>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12701-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3452483515.20030212001747@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Wed, Feb 12, 2003 at 12:17:47AM +0100, Anders Widman wrote:
> However,  the FS SHOULD support handling of bad blocks/clusters at the
> FS  layer,  even  while running in a production system. Bad blocks can
> pop  up  at any give time for no particular reason, and it is at these
> times  you  (we) need a strong and reliable filesystem that can handle
> and logically remap broken blocks/sectors.

Once i compared disk storage systems to a burger where each of components -
 ham (hdd), cheese(controller) and bread (filesystem) think that they are smartest one. and totally unwilling to cooperate to give a burger better taste.

problem with remapping that modern HDD's do this thing, and when you have
bad blocks leacked in upper layer (FS) chances are that
THINGS ARE REALLY BAD AND UGLY.

you'd better bin this HDD, unless you dont care about data.

-- 
"Cache remedies via multi-variable logic shorts will leave you crying."(cl)
Lex Lyamin
