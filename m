From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Last reiser4 snapshot is at: http://www.namesys.com/snapshots/2004.02.06/
Date: Fri, 6 Feb 2004 17:11:42 +0300
Message-ID: <16419.41118.153096.216109@laputa.namesys.com>
References: <16419.38404.592630.141335@laputa.namesys.com>
	<20040206140319.GC30481@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16713-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040206140319.GC30481@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sander@humilis.net
Cc: Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Sander writes:
 > Hi Nikita,
 > 
 > Nikita Danilov wrote (ao):
 > > new snapshot has been released. It is mainly bug-fixing release.
 > > 
 > > Take a look at the READ.ME for the list of known problems.
 > 
 > There are two LATEST_IS files in the snapshots dir.

Thanks, fixed.

 > 
 > Btw, can you please make a snapshot against the -mm tree? I think that
 > would help to get it included in that tree.

Well, making two snapshots is kind of "double trouble", because both has
to be tested and bug reports for them have to be handled. What we can
do, on the other hand, is to make a decision to switch to the -mm series
completely. But this is for Hans to decide.

Are you actually having any problems with applying/running snapshot on
top of -mm?

 > 
 > Thanks for this release!
 > 
 > With kind regards, Sander

Nikita.

 > 
