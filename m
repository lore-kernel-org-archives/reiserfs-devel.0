From: camis <camis@mweb.co.za>
Subject: Re: reiserfs v3 patches updated
Date: Tue, 06 Apr 2004 21:53:33 +0200
Message-ID: <40730ABD.3070507@mweb.co.za>
References: <1081210239.4994.69.camel@watt.suse.com> <200404061838.05099.christian.mayrhuber@gmx.net> <4072F6F1.3090806@mweb.co.za> <1081277245.30813.81.camel@watt.suse.com> <4073022E.3090100@mweb.co.za> <1081279465.30829.128.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17761-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1081279465.30829.128.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

>>The majority of the rest of the machines iowait hover around the 1%
>>mark.. CPU time tends to be about the same, just the iowait is much
>>much higher..
> 
> Very interesting.  data=ordered makes fsync more expensive, since it
> ends up syncing more then just the buffers for that one file.  Could you
> please try removing data=ordered from machine1?

Ok.. after leaving it for a few minutes..

machine 1: (mounted: 
noatime,nodiratime,alloc=skip_busy:dirid_groups,packing_groups)
  21:48:08  up 12:49,  1 user,  load average: 0.57, 0.74, 0.92
338 processes: 337 sleeping, 1 running, 0 zombie, 0 stopped
CPU states:  cpu    user    nice  system    irq  softirq  iowait    idle
            total    9.6%    0.0%   39.2%   0.0%     1.2%    6.8%  342.0%
            cpu00    2.2%    0.0%   12.4%   0.1%     0.7%    1.3%   82.9%
            cpu01    2.6%    0.0%    9.1%   0.0%     0.1%    1.9%   86.0%
            cpu02    2.4%    0.0%    9.0%   0.0%     0.0%    0.9%   87.5%
            cpu03    2.6%    0.0%    8.9%   0.0%     0.0%    2.6%   85.6%

At first i thought that it *might* be just this machine itself,
so i rebooted machine2 with the same kernel patches..

machine 2: (mounted: 
noatime,nodiratime,alloc=skip_busy:dirid_groups,packing_groups)
  21:46:24  up 7 min,  1 user,  load average: 0.85, 0.64, 0.27
315 processes: 314 sleeping, 1 running, 0 zombie, 0 stopped
CPU states:  cpu    user    nice  system    irq  softirq  iowait    idle
            total    9.6%    0.0%   34.8%   0.0%     1.2%    7.2%  346.4%
            cpu00    2.5%    0.0%    7.1%   0.1%     1.1%    2.1%   86.8%
            cpu01    2.6%    0.0%    8.0%   0.0%     0.1%    1.1%   87.8%
            cpu02    2.4%    0.0%   10.9%   0.0%     0.1%    1.7%   84.6%
            cpu03    2.1%    0.0%    8.6%   0.0%     0.0%    2.3%   86.8%

machine 3->8: (mounted: noatime,nodiratime)
  21:46:21  up 1 day,  9:12,  1 user,  load average: 1.07, 2.24, 1.88
295 processes: 294 sleeping, 1 running, 0 zombie, 0 stopped
CPU states:  cpu    user    nice  system    irq  softirq  iowait    idle
            total   11.2%    0.0%   40.8%   0.0%     2.0%    1.6%  343.2%
            cpu00    2.7%    0.0%   10.4%   0.1%     1.5%    0.3%   84.7%
            cpu01    3.0%    0.0%   10.1%   0.0%     0.1%    0.5%   85.9%
            cpu02    2.6%    0.0%   11.1%   0.0%     0.1%    0.5%   85.3%
            cpu03    2.8%    0.0%    9.2%   0.0%     0.1%    0.3%   87.2%

What i then tried on machine1 was remounting it noatime,nodiratime and
what was wierd was that the iowait stayed exactly the same, no indication
of dropping at all.. Does the kernel patches change any of the default
mount options at all? If i put the stock 2.6.5 kernel back on without
the patch applied and mount it back as noatime,nodiratime, the iowait
drops back to its normal 1%..

Cami
