From: Soeren Sonnenburg <kernel@nn7.de>
Subject: trouble with reiserfs on ppc vs-3050: wait_buffer_until_released
	...
Date: 25 Apr 2003 10:11:53 +0200
Message-ID: <1051258287.5564.1.camel@fortknox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13803-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi...

I suddenly have a file which when I access it using gvim gives

vs-3050: wait_buffer_until_released: nobody releases buffer (dev 03:07,
size 4096, blocknr 2031616, count 3, list 0, state 0x10019, page
c0add66540, (UPTODATE, CLEAN, UNLOCKED)). Still waiting (570000000)
JDIRTY !WAIT

and makes the whole machine hang...


Ideas what I could do about it ?

Soeren.

