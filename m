From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck failure
Date: Thu, 16 Jan 2003 12:32:55 +0300
Message-ID: <20030116123255.A16554@namesys.com>
References: <3E247A12.4E479B64@neolinear.com> <3E247AB6.89265382@neolinear.com> <20030115095925.A23036@namesys.com> <3E25C151.CE31D219@neolinear.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12374-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E25C151.CE31D219@neolinear.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Schrier <wschrier@neolinear.com>
Cc: it@neolinear.com, reiserfs-list@namesys.com

Hello!

On Wed, Jan 15, 2003 at 03:15:13PM -0500, Bill Schrier wrote:
> Unfortunatly, the console was completely hosed up and I couldn't even get any
> display on it to record any messages to stderr.  Sorry - don't think I can help
> there...

Hm. You still have not told us what version of reiserfsck was that.
Also can you please capture metadata snapshot for us
(debugreiserfs -p /dev/yourdevice | bzip2 -9c >metadata.bz2 )
and make it available for us to download?
Thank you.

Bye,
    Oleg
