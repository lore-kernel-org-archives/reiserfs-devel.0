From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 15:18:00 +0100
Message-ID: <m3sm5nj2ef.fsf@merlin.emma.line.org>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>
	<m38y7gx8kq.fsf@merlin.emma.line.org>
	<20041230235911.4911a20c.hihone@bigpond.net.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22951-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041230235911.4911a20c.hihone@bigpond.net.au>
	(hihone@bigpond.net.au's message of "Thu, 30 Dec 2004 23:59:11 +1100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hihone@bigpond.net.au
Cc: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>, reiserfs-list@namesys.com

Cal <hihone@bigpond.net.au> writes:

> ----------
> and then at Thu, 30 Dec 2004 13:40:53 +0100, it was written ...
>  ... 
>  >Anyone is free to choose the file system, and as the simple
>  >demonstration code posted earlier shows a serious flaw in reiserfs,
>  >Hans's response was boldfaced, I ditched reiserfs3. End of story.
>  >
>
> Your policy and philosophy on file system selection are yours to enjoy as
> you see fit, but the anger and angst ... ?   Phew!! 

I have no interest to deal with systems that have known and reproducible
cases of failure that are nondeterministic in practical use.

And Marc's documentation showed this is a real-world problem, not an
ivory tower problem.

The reiserfs story is over for me. All private machines I deal with are
reiserfs-free as of a few hours ago.

It was just one bug too many, and it was handled unprofessionally,
unlike many bugs before which had been dealt with on short notice
usually, or at least accepted for looking into.

I'll phase reiser3 out on my work machines as I see fit.

I have seen too many bugs in reiserfs3.

I do believe reiserfs4 fixes some design flaws of reiser3, and when the
implementation issues are all shaken out in one or two years' time, it
may be a good file system and I will look at it - I trust the reiserfs
team can learn from their mistakes.

I hope they learn that THIS handling of the error was wrong.

"Who cares, not us for the past five years" is not a proper response to
a real-world problem.

-- 
Matthias Andree
