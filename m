From: Bill Schrier <wschrier@neolinear.com>
Subject: Re: reiserfsck failure
Date: Thu, 16 Jan 2003 08:19:02 -0500
Sender: wschrier@neolinear.com
Message-ID: <3E26B146.E09BCF45@neolinear.com>
References: <3E247A12.4E479B64@neolinear.com> <3E247AB6.89265382@neolinear.com> <20030115095925.A23036@namesys.com> <3E25C151.CE31D219@neolinear.com> <20030116123255.A16554@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12388-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: it@neolinear.com, reiserfs-list@namesys.com, vitaly@namesys.com

Oleg, creating that file now.  I will send instructions on where/how to download
once it is ready.

Vitaly, I'm sure that I used the same reiserfsck each time.  We did nothing on the
system to change anything.  It is possible that the core file came from the --check
run.  Over the past week or so, we've run one --check, one --rebuild-tree that
failed, and one --rebuild-tree that succeeded.  The system is now up and running in
a usable state.

Bill

Oleg Drokin wrote:

> Hello!
>
> On Wed, Jan 15, 2003 at 03:15:13PM -0500, Bill Schrier wrote:
> > Unfortunatly, the console was completely hosed up and I couldn't even get any
> > display on it to record any messages to stderr.  Sorry - don't think I can help
> > there...
>
> Hm. You still have not told us what version of reiserfsck was that.
> Also can you please capture metadata snapshot for us
> (debugreiserfs -p /dev/yourdevice | bzip2 -9c >metadata.bz2 )
> and make it available for us to download?
> Thank you.
>
> Bye,
>     Oleg

--
William J. Schrier              Phone: 412.968.5780 x151
Neolinear, Inc.                 Fax:   412.968.5788
583 Epsilon Drive               Email: wschrier@neolinear.com
Pittsburgh, PA  15238



