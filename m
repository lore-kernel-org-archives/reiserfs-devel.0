From: Paul van der Vlis <paul@vandervlis.nl>
Subject: warning: vs-8115: get_num_ver: not directory item
Date: Thu, 27 Jan 2005 16:14:28 +0100
Message-ID: <41F90554.5020902@vandervlis.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23221-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

I've heard about some problems with Reiserfs on the 2.6.8 kernel:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=274167

And I get the following error in my logs:
ReiserFS: sda7: warning: vs-8115: get_num_ver: not directory item

On Google, I found that this is harmless. Is that true?

I am using this Debian kernel: 2.6.8-2-k7  (no SMP).
On another machine I use: 2.6.8-1-686-SMP

The latest reiserfsck says: everything is OK.

With regards,
Paul van der Vlis.

