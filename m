From: Chris Mason <mason@suse.com>
Subject: Re: Apparent race condition in do_journal_begin_r() with UL kernel
Date: 16 Sep 2003 11:15:40 -0400
Message-ID: <1063725339.14926.125.camel@tiny.suse.com>
References: <1063725179.12929.548.camel@biker.psw.pdb.fsc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15673-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1063725179.12929.548.camel@biker.psw.pdb.fsc.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martin Wilck <Martin.Wilck@Fujitsu-Siemens.com>
Cc: Reiser FS Mailing List <reiserfs-list@namesys.com>

On Tue, 2003-09-16 at 11:12, Martin Wilck wrote:
> Hi,
> 
> this problem may or may not be related to the last message I sent to
> this list ("is_tree_inode ..").
> 
> The problem occurs on the same machine, with the same test scenario.
> I applied Oleg's patch and successfully got rid of the
> "is_tree_inode..." messages. 

Ok, I've been tracking the is_tree_node messages for about a week now,
but only on the latest beta UL kernels.  Which UL kernel exactly have
you been using?

The patch of mine that Oleg forwarded shouldn't be needed.  There's
actually a smaller patch from vs@namesys.com that I'm trying here.

-chris


