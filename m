From: Chris Mason <mason@suse.com>
Subject: Re: using of XATTRs instead of pseudo files for accessing
	reiser4	file attributes.
Date: Tue, 06 Apr 2004 08:13:24 -0400
Message-ID: <1081253603.4977.77.camel@watt.suse.com>
References: <38261445506-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17741-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <38261445506-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

On Mon, 2004-04-05 at 18:41, Alexander G. M. Smith wrote:
> Chris Mason wrote on Mon, 05 Apr 2004 08:46:26 -0400:
> > xattrs are the current linux api, you'll make it much easier for people
> > to use reiser4 by supporting it (in addition to whatever new and cool
> > API you develop).
> 
> One of the big points is to cut down on the number of APIs and gain
> in saved effort.  Listing attributes?  Just use good old ReadDir().
> With a common name space, you can use grep and other well developed
> tools to deal with attributes.  And so on.

Sure, I think namesys has some great ideas on the new pseudo files.  

But, there are existing apps using the xattrs, it makes sense to get
them for a relatively small programming effort in reiser4 instead of
having to modify each one and get patches up stream.

-chris


