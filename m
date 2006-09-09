From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: Re: reiserfsck (3.6.19) --rebuild-tree failed
Date: Sat, 09 Sep 2006 17:25:54 +0200
Message-ID: <4502DD02.500@dermichi.com>
References: <200609081442.k88Eggwv029431@smtp.hispeed.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29838-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609081442.k88Eggwv029431@smtp.hispeed.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: grossnik.mailinglists@hispeed.ch
Cc: vs@namesys.com, reiserfs-list@namesys.com

Hi,
 > I'm 100% happy. Now it did not stop.
 > Either it would haven been nessesary to run it twice or the new 
version I've got from did the trick.
Good to hear that!
 > I thank you so much!
 > Now I go any buy a new disk!!!
Usually when a disk goes bad you should get a new disk FIRST, then make 
an image from the old disk with dd_rescue and then use fsck. It is much 
safer this way and you don't have to fiddle around with the badblock 
options at all.

Useful links:
[1] http://www.garloff.de/kurt/linux/ddrescue/
[2] http://www.knopper.net/knoppix/
[3] http://www.extremetech.com/article2/0,1697,1928206,00.asp

kind regards,
Michael
