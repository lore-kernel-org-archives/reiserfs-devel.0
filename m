From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Snapshot against 2.6.1 released.
Date: Thu, 22 Jan 2004 20:20:17 +0300
Message-ID: <16400.1617.53047.679998@laputa.namesys.com>
References: <16396.11375.115895.934750@laputa.namesys.com>
	<20040120080223.2921.qmail@web21505.mail.yahoo.com>
	<16396.64924.478222.923131@laputa.namesys.com>
	<400DAC72.1060502@free.fr>
	<401004DF.7080100@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16607-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <401004DF.7080100@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vince <fuzzy77@free.fr>
Cc: reiserfs-list@namesys.com

Vince writes:
 > 
 > > Nikita Danilov wrote:
 > 
 > >> My apology for everyone for missing this bit in the READ.ME:
 > >>
 > >> you have to re-create your file-systems with mkfs supplied with this
 > >> snapshot.
 > >>
 > 
 > I wrote:
 > > Is it really mandatory to re-create or will a "fsck.reiser4 --build-fs" 
 > > be able to fix the filesystem to the new format ? 
 > > 
 > 
 > (replying to myself) It seems indeed really mandatory... I got a kernel 
 > oops while fsck-ing my old reiser4 partition with the new 
 > kernel+userspace snapshot (kernel is 2.6.2-rc1-mm1, reiser4 snapshot is 
 > 2004.01.19.fixed). And now the (unfixed/corrupted) partition causes the 
 > following oops when I try to mount it:

Yes, mount was unable to handle an error. This is hopefully fixed and
will be included into new snapshot.


 > 
 > reiser4[mount(177)]: get_ready_format40 
 > (fs/reiser4/plugin/disk_format/disk_format40.c:248)[nikita-3228]:
 > WARNING: Key format mismatch. Only large keys are supported.

Nikita.
