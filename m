From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [v4] reiser4 dream came true... in Solaris9.
Date: Mon, 4 Aug 2003 17:50:20 +0400
Message-ID: <16174.25756.572144.198132@laputa.namesys.com>
References: <16174.6357.805212.892859@laputa.namesys.com>
	<3F2E6007.9000902@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15135-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F2E6007.9000902@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Reiserfs developers mail-list <Reiserfs-Dev@Namesys.COM>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hans Reiser writes:
 > Nikita Danilov wrote:
 > 
 > >Solaris9 supports extended attributes accessible through usual file
 > >system namespace. Support in cp, tap, cpio.
 > >
 > >http://docs.sun.com/db/doc/816-0220/6m6nkorp9?a=view
 > >
 > >Nikita.
 > >
 > >
 > >  
 > >
 > What they did seems like what someone not really understanding what we 
 > are doing would copy from our implementation if some guy from marketing 
 > said that they needed it to compete with us.  They don't really move 
 > attributes into the namespace.  They access them with an API separate 
 > and additional to that used for files.  The only thing they do get right 

You missed a bit about runat(1) command:
http://docs.sun.com/db/doc/816-0210/6m6nb7mjs?a=view

About their copying this feature from reiser4: man pages are tagged as
"SunOS 5.9  Last Revised 22 Jun 2001". 

 > is that they store them as files and directories.  I bet that they don't 
 > have the underlying infrastructure needed for this to be efficient for 
 > small attributes though, and I bet the performance sucks.
 > 
 > Sorry for my ungenerous comments.

You should file IP violation scam^H^H^Huit against Sun.

 > 
 > -- 
 > Hans
 > 
 > 

Nikita.
