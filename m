From: Cami <camis@mweb.co.za>
Subject: Re: reiserfs v3 patches updated
Date: Tue, 06 Apr 2004 23:30:45 +0200
Message-ID: <40732185.8060303@mweb.co.za>
References: <1081210239.4994.69.camel@watt.suse.com> <200404061838.05099.christian.mayrhuber@gmx.net> <4072F6F1.3090806@mweb.co.za> <1081277245.30813.81.camel@watt.suse.com> <4073022E.3090100@mweb.co.za> <1081279465.30829.128.camel@watt.suse.com> <40730ABD.3070507@mweb.co.za> <1081283607.30811.206.camel@watt.suse.com> <4073186C.3010601@mweb.co.za> <1081285851.30813.269.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17768-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1081285851.30813.269.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

>>>I'm a little slow today.  data=ordered is the default with these
>>>patches.  You need to mount -o data=writeback.
>>
>>data=writeback yields pretty much the same iowait results..
>>(machine 1+2 are around 5%->8% whereas machine 3->8 are at around 0.8%)
> 
> This is so much faster I'm worried the io isn't actually getting done.
> In the mail server benchmark I use (synctest -n 1 -t 50 -f -F), the time
> went from 2m15s to 43s.  The old 2m15s was still faster then I used to
> get with unpatched reiserfs.
> 
> I'm posting this for the truly brave among you and a little review.  I
> need to do more tests on it.  The basic idea is to make sure we don't
> start writeback on the log buffers and metadata if someone is already
> doing it.
> 
> Also, the reiserfs work queue is not kicked during transaction end if
> some other process is going to do the commit.  This saves a lot of
> context switches.

And just as i was about to head into bed ;)

  23:26:25  up 5 min,  1 user,  load average: 0.62, 0.36, 0.14
340 processes: 339 sleeping, 1 running, 0 zombie, 0 stopped
CPU states:  cpu    user    nice  system    irq  softirq  iowait    idle
            total    7.6%    0.0%   30.8%   0.0%     1.2%    0.4%  358.8%
            cpu00    1.7%    0.0%    6.6%   0.1%     1.1%    0.1%   90.0%
            cpu01    2.1%    0.0%   11.1%   0.0%     0.0%    0.0%   86.7%
            cpu02    2.0%    0.0%    6.8%   0.0%     0.0%    0.3%   90.6%
            cpu03    1.9%    0.0%    6.7%   0.0%     0.0%    0.1%   91.1%

  23:27:11  up 5 min,  1 user,  load average: 0.40, 0.34, 0.14
343 processes: 342 sleeping, 1 running, 0 zombie, 0 stopped
CPU states:  cpu    user    nice  system    irq  softirq  iowait    idle
            total    6.8%    0.0%   26.0%   0.0%     0.8%    0.4%  364.8%
            cpu00    1.7%    0.0%    5.9%   0.1%     0.9%    0.1%   91.0%
            cpu01    1.5%    0.0%    5.3%   0.0%     0.0%    0.0%   93.1%
            cpu02    1.9%    0.0%    4.7%   0.0%     0.0%    0.1%   93.1%
            cpu03    1.9%    0.0%    9.9%   0.0%     0.1%    0.0%   87.9%

  23:27:21  up 5 min,  1 user,  load average: 0.63, 0.40, 0.16
343 processes: 342 sleeping, 1 running, 0 zombie, 0 stopped
CPU states:  cpu    user    nice  system    irq  softirq  iowait    idle
            total    8.0%    0.0%   28.4%   0.0%     1.2%    0.4%  360.8%
            cpu00    2.2%    0.0%    6.1%   0.1%     1.1%    0.0%   90.2%
            cpu01    2.0%    0.0%   10.4%   0.0%     0.1%    0.3%   86.8%
            cpu02    1.7%    0.0%    6.4%   0.0%     0.0%    0.1%   91.6%
            cpu03    1.7%    0.0%    5.7%   0.0%     0.0%    0.1%   92.3%

  23:27:32  up 6 min,  1 user,  load average: 0.53, 0.38, 0.16
343 processes: 341 sleeping, 2 running, 0 zombie, 0 stopped
CPU states:  cpu    user    nice  system    irq  softirq  iowait    idle
            total   10.0%    0.0%   35.6%   0.0%     1.6%    0.8%  350.8%
            cpu00    2.4%    0.0%    8.3%   0.1%     1.3%    0.1%   87.4%
            cpu01    2.6%    0.0%   11.8%   0.0%     0.1%    0.1%   85.1%
            cpu02    2.4%    0.0%    7.8%   0.0%     0.1%    0.1%   89.3%
            cpu03    2.4%    0.0%    8.0%   0.0%     0.0%    0.3%   89.1%

  23:27:37  up 6 min,  1 user,  load average: 0.49, 0.38, 0.16
343 processes: 342 sleeping, 1 running, 0 zombie, 0 stopped
CPU states:  cpu    user    nice  system    irq  softirq  iowait    idle
            total    6.4%    0.0%   26.4%   0.0%     0.4%    0.0%  365.2%
            cpu00    1.7%    0.0%    5.9%   0.1%     0.5%    0.0%   91.6%
            cpu01    1.5%    0.0%    9.5%   0.0%     0.0%    0.0%   88.9%
            cpu02    1.7%    0.0%    5.5%   0.0%     0.0%    0.1%   92.5%
            cpu03    1.7%    0.0%    5.7%   0.0%     0.1%    0.1%   92.2%

  23:27:47  up 6 min,  1 user,  load average: 0.41, 0.36, 0.16
343 processes: 342 sleeping, 1 running, 0 zombie, 0 stopped
CPU states:  cpu    user    nice  system    irq  softirq  iowait    idle
            total    8.0%    0.0%   29.2%   0.0%     1.2%    0.4%  360.0%
            cpu00    2.0%    0.0%    9.7%   0.1%     0.9%    0.1%   86.8%
            cpu01    2.2%    0.0%    5.9%   0.0%     0.0%    0.1%   91.6%
            cpu02    1.7%    0.0%    7.4%   0.0%     0.1%    0.0%   90.6%
            cpu03    2.4%    0.0%    6.1%   0.0%     0.0%    0.3%   91.0%

Hrmph! Its not going above 0.8% iowait.. it hangs around the 0.0% ->
0.04% mark.. Looks good, thanks.. ;)

Regards,
Cami


