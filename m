From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Creditsd [Re: Speaking of credits...]
Date: Mon, 10 May 2004 21:37:41 +0300
Message-ID: <20040510183741.GZ29226@nysv.org>
References: <3DF9165145FACB4C96977FF650C1E9040C469F7D@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18588-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3DF9165145FACB4C96977FF650C1E9040C469F7D@its-mail1.its.corp.gwl.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Burnes, James" <james.burnes@gwl.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Mon, May 10, 2004 at 12:21:44PM -0600, Burnes, James wrote:

>I would have to write most of the internal mechanisms in creditsd for the 
>screensaver anyway.  Might as well make the interface universal....

Correct me if I'm wrong, but shouldn't it be like a little database
somewhere under /var/ or somewhere with an interface socket in /tmp/?

Then one would, of course, have to write a renderer for the screensaver
that takes a random entry from the database and displays it on the screen.

I have no experience in screensavers on that level (if I want to lock
my computer I type xlock) so I may be drifting.

Naturally a good API that allows even the kernel to interface (for proc,
or is it ok for userland daemons to publish stuff there?) with it is
the way to go.

I wonder if some already-existing database would be good for this.

One will also need a good way of updating this database...

-- 
mjt

