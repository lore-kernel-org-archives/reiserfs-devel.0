From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: New reiser4 snapshot (as of August 22, 2003)
Date: Fri, 22 Aug 2003 21:57:33 +0400
Message-ID: <16198.22925.274848.501590@laputa.namesys.com>
References: <20030822150853.GA960@namesys.com>
	<1061574745.5714.1.camel@pilot.stavtrup-st.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15389-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1061574745.5714.1.camel@pilot.stavtrup-st.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Nielsen <Lovechild@foolclan.com>
Cc: reiserfs-list@namesys.com

David Nielsen writes:
 > This needs to be fixed - it doesn't compile 

Oops. As a work around, please, turn on REISER4_DEBUG_OUTPUT ("Printing"
in reiser4 debug option sub menu).

 > 
 > GCC version is 3.3.1
 > 

Nikita.

 >   CC      fs/reiser4/txnmgr.o
