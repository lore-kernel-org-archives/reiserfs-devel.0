From: Nick Burrett <nick@dsvr.net>
Subject: labelling partitions with reiserfstune
Date: Mon, 16 Dec 2002 13:31:33 +0000
Message-ID: <3DFDD5B5.7050000@dsvr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12168-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

It would be useful if the disk label of a mounted partition could be 
changed by reiserfstune.  Since I'm only after changing the label and 
not the journal, the following assertion seems unreasonable.

bash-2.05# reiserfstune -l / /dev/rd/c0d0p1

<-------------reiserfstune, 2002------------->
reiserfsprogs 3.6.4

reiserfstune: can not rebuild journal of mounted filesystem
bash-2.05#


Regards,


Nick.


-- 
Nick Burrett
Network Engineer, Designer Servers Ltd.   http://www.dsvr.co.uk

