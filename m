From: David Masover <ninja@slaphack.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 13:25:37 -0500
Message-ID: <432DB121.9030908@slaphack.com>
References: <432AFB44.9060707@namesys.com> <20050918102658.GB22210@infradead.org> <200509181406.25922.chrivers@iversen-net.dk> <200509181532.57908.vda@ilport.com.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932160AbVIRSZg@vger.kernel.org>
In-Reply-To: <200509181532.57908.vda@ilport.com.ua>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Denis Vlasenko <vda@ilport.com.ua>
Cc: Christian Iversen <chrivers@iversen-net.dk>, Christoph Hellwig <hch@infradead.org>, chriswhite@gentoo.org, Hans Reiser <reiser@namesys.com>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Denis Vlasenko wrote:

> If you want reiser4 included into mainline, do something. Like download
> a patch and try to use it.

Alright...

> Last time I tried, it didn't work. Kernel locked up. Namesys was quick
> with fix for the lockup, but then "ls ." failed to work. I sent all
> the data (kernel version, fs image, etc) to Namesys but after several
> email iterations it died out with no resolution.

When was "last time"?

> I will try again sometime. Maybe it got better.

I have three boxes running Reiser4 for everything except /boot, and no 
problems yet, except an occasional missing feature, like a 
repacker/resizer.  One's a Pentium 3, the other two are amd64s.

I've had a total of one crash each on the amd64s, and one of those was 
while playing a game, and could easily have been the nvidia drivers.  I 
can't reproduce the other one, and the box has been fine since -- and 
both amd64s are overclocked by 600 mhz, so I have a sneaking suspicion 
that it might have been hardware.

No crashes yet on the Pentium 3, which isn't overclocked at all.

No lost data yet either, in fact, I recovered from an essential 'rm -rf' 
of a Reiser4 partition, so I could even say Reiser4 (or rather, 
fsck.reiser4) has *found* data for me.



For a long time, it's been painfully obvious that the reasons Reiser4 
isn't in the kernel all have to do with things like coding style and 
politics.  At this point, if I tried to do anything more than be an 
active user, I'd be so far out of my depth I'd need a life jacket.
