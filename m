From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Bugs on big endian systems
Date: Wed, 3 Mar 2004 20:59:49 -0500
Message-ID: <200403032059.49989.phma@webjockey.net>
References: <4045D745.8070204@sysgo.com> <4046769A.9030806@namesys.com> <1078365334.1526.2.camel@boadicea>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17068-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1078365334.1526.2.camel@boadicea>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs-List@namesys.com

On Wednesday 03 March 2004 20:55, Richard Heycock wrote:
> On Thu, 2004-03-04 at 11:21, Hans Reiser wrote:
> > Thanks Jeff and Pavel.  Nikita, send Pavel the usual agreement, and
> > we'll send to Linus unless someone finds an objection.  Edward, read
> > this patch, test it on alpha,
>
> The Alpha is a little endian machine.

True, but it is also an eight-byte machine, which is different from the Intel, 
so it should be tested. Macs are big-endian.

phma
