From: Martin Wilck <Martin.Wilck@Fujitsu-Siemens.com>
Subject: Re: Apparent race condition in do_journal_begin_r() with UL kernel
Date: 19 Sep 2003 11:32:48 +0200
Message-ID: <1063963968.6484.3.camel@biker.psw.pdb.fsc.net>
References: <1063725179.12929.548.camel@biker.psw.pdb.fsc.net> 
	<20030916153620.GA773@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15700-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030916153620.GA773@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Reiser FS Mailing List <reiserfs-list@namesys.com>, mason@suse.com

Am Die, 2003-09-16 um 17.36 schrieb Oleg Drokin:

> What if you press 'reset' and then boot and try to mount the fs?
> Will you see ~ 2k uncommited transactions replayed?

Yes, exactly.

> If so, we recently saw similar thing. The fix is not ready yet, though.

> Below you can find the patch that may help you if I am right about roots of your second problem.
> This is not proper fix but merely a quick plug. (I verified and it passes my testcase)
> Chris promised to send proper patch yesterday, but seems he is busy right now.

Yes, the results with this patch (and the other one you sent which has
to be slightly modified for my UL kernel) look promising. ~40h IO
activity now and no problems. If our machines are still doing fine after
the weekend we'll conclude these patches solve the problem (actually,
both problems) for us. I'll give you another feedback then.

Thanks for the help,
Martin


-- 
Martin Wilck                Phone: +49 5251 8 15113
Fujitsu Siemens Computers   Fax:   +49 5251 8 20409
Heinz-Nixdorf-Ring 1	    mailto:Martin.Wilck@Fujitsu-Siemens.com
D-33106 Paderborn           http://www.fujitsu-siemens.com/primergy





