From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Reiser4 problems
Date: Mon, 20 Oct 2003 14:12:42 +0400
Message-ID: <16275.46362.247930.879666@laputa.namesys.com>
References: <3F928BE3.6070201@cyberone.com.au>
	<3F929B2E.3020509@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15862-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F929B2E.3020509@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Piggin <piggin@cyberone.com.au>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hans Reiser writes:
 > Nick Piggin wrote:
 > 
 > > Hi Hans,
 > > Sorry to report this - I know you had said there were problems with the
 > > latest snapshot, and you almost certainly have hit this problem. I'll

Surprisingly not.

 > > report just in case:
 > >
 > > kernel 2.6.0-test7. ext3 system drive, Reiser4 SCSI test drive. I get a
 > > lot of SCSI I/O errors moments into untarring a test image onto the new
 > > Reiser4 filesystem. Created with default options. Mounted with noatime,
 > > nodiratime. Reiserfs soon panics.

Can you send us relevant parts of the system log: SCSI errors and panic?

 > >
 > > Badblocks shows the drive to be OK. ext2 fares alright. Let me know if
 > > you would like more info.
 > >
 > > Best regards,
 > > Nick
 > >

Nikita.

 > >
 > >
 > >
 > 
 > Nikita will respond to this on Monday, ok?  Thanks,
 > 
 > -- 
 > Hans
 > 
 > 
