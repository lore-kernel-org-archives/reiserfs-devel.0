From: Chris Mason <mason@suse.com>
Subject: Re: journal viewer for reiserfs
Date: Fri, 21 May 2004 11:24:13 -0400
Message-ID: <1085153052.9467.1579.camel@watt.suse.com>
References: <1085152358.11303.1.camel@redeeman.kaspersandberg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18801-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1085152358.11303.1.camel@redeeman.kaspersandberg.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: redeeman@metanurb.dk
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

On Fri, 2004-05-21 at 11:12, Redeeman wrote:
> hey, i just lost power today, and i saw it mentioned some transactions
> it replayed. now, i dont like that, but happend is happend. though, i
> would like to know what the transactions really were, is such thing
> possible? 
> 
> note: reiserfs, not reiser4
> 

The transactions are block based, so there's no nice logical way to sum
them up.  You can look at the blocks in the log with debugreiserfs -j
/dev/xxx /dev/xxx, but that's not very exciting.

-chris


