From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Snapshot against 2.6.1 released.
Date: Tue, 20 Jan 2004 13:06:20 +0300
Message-ID: <16396.64924.478222.923131@laputa.namesys.com>
References: <16396.11375.115895.934750@laputa.namesys.com>
	<20040120080223.2921.qmail@web21505.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16581-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040120080223.2921.qmail@web21505.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paolo Correnti <paolunix@yahoo.com>
Cc: Domenico Andreoli <cavok@libero.it>, reiserfs-list@namesys.com

Paolo Correnti writes:
 > I have the same "Domenico's problem":
 >  - downloaded Kernel 2.6.1
 >  - applied SNAPSHOT 2004.01.19 FIXED
 >  
 > Trying to mount Reiser4 partition all I obtain is:
 > 
 > Wrong Master Super Block Magic
 > fs/reiser4/init_siper.c line 166

My apology for everyone for missing this bit in the READ.ME:

you have to re-create your file-systems with mkfs supplied with this
snapshot.

 > 
 > Going back to Kernel 2.6.0 + SNAPSHOT 2003.12.23
 > I've no problems mounting and dismounting my Reiser4
 > partition (only kernel panic during shutdown if I
 > try to use another Reiser4 partition, I think is a
 > dismount problem)
 > 
 > I've also no problem with Kernel 2.6.1 + SNAPSHOT
 > 2003.12.23 using only one Reiser4 partition (with more
 > partitions see the note above).
 > 
 > All the best
 > 
 > PC
 > 

Nikita.

 > 
