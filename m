From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: using of XATTRs instead of pseudo files for accessing
 reiser4	=?us-ascii?q?file?= attributes.
Date: Mon, 05 Apr 2004 18:41:45 -0400 EDT
Message-ID: <38261445506-BeMail@cr593174-a>
References: <1081169185.3548.373.camel@watt.suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17733-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1081169185.3548.373.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>

Chris Mason wrote on Mon, 05 Apr 2004 08:46:26 -0400:
> xattrs are the current linux api, you'll make it much easier for people
> to use reiser4 by supporting it (in addition to whatever new and cool
> API you develop).

One of the big points is to cut down on the number of APIs and gain
in saved effort.  Listing attributes?  Just use good old ReadDir().
With a common name space, you can use grep and other well developed
tools to deal with attributes.  And so on.

- Alex
