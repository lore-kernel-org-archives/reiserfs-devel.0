From: Chris Mason <mason@suse.com>
Subject: Re: Data loss during power off
Date: 27 Jun 2002 12:48:02 -0400
Message-ID: <1025196482.1597.1.camel@tiny>
References: <1025189617.1657.19.camel@tiny> 
	<20020627153607.1352.qmail@hm47.locaweb.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10870-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020627153607.1352.qmail@hm47.locaweb.com.br>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Henrique Faria <henrique@streamworks.com.br>
Cc: reiserfs-list@namesys.com

On Thu, 2002-06-27 at 08:36, Henrique Faria wrote:
> I'll try the patch! Can JOURNAL_MAX_TRANS_AGE be zero? Do I need to set up
> JOURNAL_MAX_COMMIT_AGE too?

No, the best way to do it is to set JOURNAL_MAX_BATCH to 1.  That way it
is size dependent instead of age dependent.  The namesys journal
relocation patch (which my data logging stuff is against), includes the
ability to set these parameters on a per FS basis without recompiling.

-chris


