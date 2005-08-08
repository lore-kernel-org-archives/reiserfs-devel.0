From: Pysiak Satriani <pysiak.satriani@wp.pl>
Subject: Re: reiser4 performance
Date: Mon, 8 Aug 2005 22:57:06 +0200
Message-ID: <673223303.20050808225706@wp.pl>
Reply-To: Pysiak Satriani <pysiak.satriani@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25357-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello David,

Monday, August 8, 2005, 9:56:36 PM, you wrote:
> What I want is the repacker, beacuse performance does steadily degrade
> on my Reiser4 systems, eventually getting worse than Reiser3, but not
> worse than VFAT -- probably because my old FAT partitions are on old,
> virus-ridden systems.
Hmm, so it seems that repacking would be a quite mandatory thing to do
once in a while. Is that what you are saying?
Kinda strange, I do not think other fss need it that bad, but running it
from cron.monthly would suffice.

How much time does repacking take? I know it takes a lot of factors, but
aproximately how much?

During repacking is the system usable, i mean: can i start repacking and
then continue hacking/writing/playing or whatever i am doing on the
computer?

-- 
Best regards,
Pysiak

