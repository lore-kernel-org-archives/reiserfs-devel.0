From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Squid eating up all CPU
Date: Tue, 7 Sep 2004 19:03:47 +0400
Message-ID: <20040907150347.GD6294@backtop.namesys.com>
References: <200409071528.06971.rmeijer@internet.gr> <20040907125235.GC6294@backtop.namesys.com> <200409071650.46311.rmeijer@internet.gr>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21572-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200409071650.46311.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Raymond A. Meijer" <rmeijer@internet.gr>
Cc: reiserfs-list@namesys.com

On Tue, Sep 07, 2004 at 04:50:46PM +0300, Raymond A. Meijer wrote:
> On Tue 7 September 2004 15:52, Alex Zarochentsev wrote:
> 
> Hi Alex,
> 
> > > Everything seems to work well, except..the Squid process is eating up all CPU:
> > > 
> > >   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
> > >  4787 proxy     39   0 45700  10m 2580 R 87.7  1.4   7:12.94 squid
> 
> > can you boot the kernel with profile=2 boot parameter and get profile info for
> > the period when nothing except squid is active?
> > 
> > echo 1 > /proc/profile
> > sleep 300
> > cat /proc/profile  | readprofile -m [<actual system map file> | sort -rn | head -n 20
> > 
> > I think reiser4 should be built not as a module otherwise System.map would not
> > contain reiser4 symbols.
> 
> I don't think Reiser4 is at fault here:
> 
> I found out that the Weatherfox plugin for Firefox had caused Firefox to
> crash, and therefore every time I started Firefox the Quality Feedback 
> Agent tried to send a message.
> 
> For some reason that didn't work, and the following entries showed up in 
> Squid's access.log after a LONG time:
> 
> 1094561818.215 1041126 127.0.0.1 TCP_MISS/504 1467 POST http://talkback.mozilla.org/spiral-bin/Collector.dll - DIRECT/207.126.111.208 text/html
> 1094561860.054 1004601 127.0.0.1 TCP_MISS/504 1467 POST http://talkback.mozilla.org/spiral-bin/Collector.dll - DIRECT/207.126.111.208 text/html
> 1094561860.054 945630 127.0.0.1 TCP_MISS/504 1467 POST http://talkback.mozilla.org/spiral-bin/Collector.dll - DIRECT/207.126.111.208 text/html
> 
> Apparently the QFA continued to do this even after closing both its window
> and Firefox, without any relevant processes showing up with ps..?!
> 
> Does this sound familiar?

there should be the QFA process, I think. 

> 
> After I uninstalled the Weatherfox extension the symptoms disappeared.
> 
> I'll try to reproduce it though..
> 
> Ray

-- 
Alex.
