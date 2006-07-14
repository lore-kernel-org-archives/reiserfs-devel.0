From: Brad Dameron <brad@seatab.com>
Subject: SuSe 9.3 kernel 2.6.11.4-21.11-smp warning: vs-8115: get_num_ver:
	not directory or indirect item error
Date: Fri, 14 Jul 2006 12:16:24 -0700
Message-ID: <1152904584.24048.5.camel@serpent.office.seatab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29008-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I am seeing a lot of these errors:

ReiserFS: sda7: warning: vs-8115: get_num_ver: not directory or indirect
item

I did a google search and all I see is emails back from 2004/2005 about
it being a issue with the 2.6.8 kernel. Are these warnings something I
should run reiserfsck on the partition to correct or something I should
ignore? This is on a production server and I would hate to lose the
data.

Thanks,
Brad Dameron
SeaTab Software
www.seatab.com


