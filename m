From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Squid eating up all CPU
Date: Tue, 7 Sep 2004 16:52:35 +0400
Message-ID: <20040907125235.GC6294@backtop.namesys.com>
References: <200409071528.06971.rmeijer@internet.gr>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21565-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200409071528.06971.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Raymond A. Meijer" <rmeijer@internet.gr>
Cc: reiserfs-list@namesys.com

Hello,

On Tue, Sep 07, 2004 at 03:28:06PM +0300, Raymond A. Meijer wrote:
> Hi,
> 
> I have an interesting problem. I've been running Squid for a long time now on 
> my workstation with its cache directories on a Reiser4 partition.
> 
> Since Reiser4 has been stable for some time now, I decided to reformat my 
> other partitions (except / which is Ext3) to Reiser4 as well.
> 
> Everything seems to work well, except..the Squid process is eating up all CPU:
> 
>   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
>  4787 proxy     39   0 45700  10m 2580 R 87.7  1.4   7:12.94 squid
> 
> This happens even when there are no connections made through Squid!
> 
> My machine is a Pentium4 1.8GHz with 768MB RAM and 2 WD 40GB HDDs.
> 
> It's running Debian Testing with the following Squid (related) packages 
> installed:
> 
> ii  squid                         2.5.6-8
> ii  squid-cgi                     2.5.6-8
> ii  squid-common                  2.5.6-8
> ii  squid-prefetch                0.7-1
> ii  squidclient                   2.5.6-8
> ii  adzapper                      20040408-1
> 
> Kernel 2.6.8.1-cko5 is being used.
> 
> I though I'd ask this list since Squid was working fine, with low CPU usage, 
> for many months. I've rebooted the machine several times in the past (before 
> converting the system partitions to Reiser4) and Squid never displayed this 
> behaviour before.
> 
> I don't see anything relevant in the Squid log files or in the syslog.
> 
> Where do I start the troubleshooting process? Has anybody seen this before?
> I'm willing to try anything to pinpoint the problem and make sure it's not 
> Reiser4 causing it ;)
> 
> Please let me know what other information you'd need.

can you boot the kernel with profile=2 boot parameter and get profile info for
the period when nothing except squid is active?

echo 1 > /proc/profile
sleep 300
cat /proc/profile  | readprofile -m [<actual system map file> | sort -rn | head -n 20

I think reiser4 should be built not as a module otherwise System.map would not
contain reiser4 symbols.

> Thanks,
> Ray

-- 
Alex.
