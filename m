From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: new reiser4 snapshot
Date: Mon, 20 Oct 2003 13:44:22 +0400
Message-ID: <16275.44662.847152.412738@laputa.namesys.com>
References: <Pine.LNX.4.44.0310191956060.15715-100000@poorvi.cse.iitd.ernet.in>
	<3F92D35D.3090806@namesys.com>
	<3F93132D.70206@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15861-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F93132D.70206@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: Hans Reiser <reiser@namesys.com>, Nishant Sharma <nishantt@cse.iitd.ernet.in>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Carl-Daniel Hailfinger writes:
 > Hans Reiser wrote:
 > > Nishant Sharma wrote:
 > > 
 > >> Hi,
 > >>
 > >> On Fri, 17 Oct 2003, Nikita Danilov wrote:
 > >>  
 > >>
 > >>> Hello,
 > >>> Reiser4 snapshot against 2.6.0-test7 has been released:
 > >>> http://namesys.com/snapshots/2003.10.17/
 > >>> Description is in http://namesys.com/snapshots/2003.10.17/READ.ME
 > >>>   
 > >>     Following is the relevant section of my .config in kernel src-dir.
 > >>
 > >> CONFIG_REISER4_FS=m
 > >> # CONFIG_REISER4_FS_SYSCALL is not set
 > >> # CONFIG_REISER4_LARGE_KEY is not set
 > 
 > I thought CONFIG_REISER4_LARGE_KEY was force-enabled by now?

No. But:

1. one has to use -o key=key_short option for mkfs.reiser4 to create
file system with small keys.

2. lately we mostly test/care about large keys performance and
stability.

 > 
 > >> # CONFIG_REISER4_CHECK is not set
 > >> CONFIG_REISER4_USE_EFLUSH=y
 > >> # CONFIG_REISER4_COPY_ON_CAPTURE is not set
 > >> # CONFIG_REISER4_BADBLOCKS is not set
 > >>
 > >>     What am I doing wrong? I believe that I followed the instructions
 > >> in http://namesys.com/snapshots/2003.10.17/READ.ME to the letter.
 > >>  
 > >>
 > > Nikita, please determine why reiser4 tells users they can configure it
 > > as a module when they cannot.

Nikita.

 > 
 > 
 > Carl-Daniel
 > 
