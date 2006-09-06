From: Joe Feise <jfeise@feise.com>
Subject: Better fsck.reiser4 needed
Date: Wed, 06 Sep 2006 01:01:05 -0700
Message-ID: <44FE8041.5060403@feise.com>
Reply-To: jfeise@feise.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29817-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

It seems that fsck.reiser4 -a doesn't do anything. It doesn't even detect
corruption.
I had a /var corruption (reiser4 on /var) over the weekend, and since I was out
of town, the machine was hanging trying to go into multi-user mode for a day
before I could fix the corruption manually. An fsck that actually would do some
automatic repairs (e.g., like ext3 which I use as the root partition) would be
really helpful.
For now, I have resorted to --fix -y at bootup time for all my reiser4
partitions, but that's just a quick hack, and rather unsatisfactory.

Cheers,
-Joe


