From: Matthijs van der Vleuten <zr40.nl@gmail.com>
Subject: Re: Squid eating up all CPU
Date: Thu, 9 Sep 2004 19:01:41 +0200
Message-ID: <31a24e2904090910015df2f61d@mail.gmail.com>
References: <200409071528.06971.rmeijer@internet.gr>
Reply-To: Matthijs van der Vleuten <zr40.nl@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21644-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200409071528.06971.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Raymond A. Meijer" <rmeijer@internet.gr>
Cc: reiserfs-list@namesys.com

On Tue, 7 Sep 2004 15:28:06 +0300, Raymond A. Meijer
<rmeijer@internet.gr> wrote:
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
> [...]
> 
> Kernel 2.6.8.1-cko5 is being used.
> 
> I though I'd ask this list since Squid was working fine, with low CPU usage,
> for many months. I've rebooted the machine several times in the past (before
> converting the system partitions to Reiser4) and Squid never displayed this
> behaviour before.
> 
> [...]
> 
> Thanks,
> 
> Ray

Upgrade to 2.6.8.1-ck6. 2.6.8.1-ck5 has disk cache issues.
