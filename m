From: Jan Kara <jack@ucw.cz>
Subject: Re: ReiserFS quota and 2.6.10
Date: Wed, 23 Feb 2005 11:28:11 +0100
Message-ID: <20050223102811.GC31151@atrey.karlin.mff.cuni.cz>
References: <20050222201726.31044.qmail@web86510.mail.ukl.yahoo.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050222201726.31044.qmail@web86510.mail.ukl.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yiannis Mavroukakis <i.mavroukakis@btinternet.com>
Cc: reiserfs-list@namesys.com

> Because I like to keep people happy, especially Valdis
> Kletnieks, I'll repost my query from another email
> account without a disclaimer..here we go.
  :) The disclaimer was quite longer than the message...

> ==========
> >From the subject, you have probably already guessed
> what I am about to ask.. 
> Is quota working ok with vanilla 2.6.10 with ReiserFS?
  Yes, the quota should be working fine - I suggest to wait a bit for
2.6.11 as it has fixed some deadlocks in the quota code appearing under
high load.

								Honza
