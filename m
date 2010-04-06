From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: reiserfs + acl corruption
Date: Tue, 6 Apr 2010 01:40:11 -0700 (PDT)
Message-ID: <alpine.DEB.2.01.1004060136060.29272@bogon.housecafe.de>
References: <54cce25c1003280829q2a173c91p55bc3297a3163452@mail.gmail.com> <alpine.DEB.2.01.1004041324340.29272@bogon.housecafe.de> <alpine.DEB.2.01.1004041755070.29272@bogon.housecafe.de> <alpine.DEB.2.01.1004042240500.29272@bogon.housecafe.de>
 <4BBA0313.4020405@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4BBA0313.4020405@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Marco Gatti <marco.gatti@gmail.com>, reiserfs-devel@vger.kernel.org

On Mon, 5 Apr 2010 at 11:34, Jeff Mahoney wrote:
> Ok. I'm able to reproduce this with your script. I _can't_ reproduce it
> with 8 GB of memory, but I can reproduce it with mem=256m. That's a good
> data point.

On a 8GB machine I can reproduce it with 1000000 files, 500000 files is 
fine. I haven't found out the exact threshold though.

v40z1# free -k
             total       used       free     shared    buffers     cached
Mem:       8121176    5497464    2623712          0     718264    1878760
-/+ buffers/cache:    2900440    5220736
Swap:       996024       1016     995008


Could you comment on the relation to #14826, or is this something 
completely different. I'm getting more and more jdm-20002 in my syslog and 
it's making me kinda nervous...

Thanks,
Christian.

[0] http://bugzilla.kernel.org/show_bug.cgi?id=14826
-- 
BOFH excuse #336:

the xy axis in the trackball is coordinated with the summer solstice
