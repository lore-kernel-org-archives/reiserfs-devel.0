From: John <geearf@free.fr>
Subject: No space left on rfs4
Date: Fri, 29 Feb 2008 17:45:55 +0100
Message-ID: <656df51f9a130e6a80976de1dde9d07f@free.fr>
Reply-To: geearf@free.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello people,

I've been following this list for some time but this is my first e-mail here since at least 2 years.
(thank you Edwards for your work, you've fixed many of my issues lately)


Today I am mailing you about an issue that you probably know about, but that I still believe needs to be fixed: filling the FS till it corrupts itself.

How many times have I almost killed by computer by filling my rfs4, copying data on the wrong partition or doing something else...

The FS needs to be able to handle that, but instead some files get corrupted and when I try to delete them my computer is kind of dead and needs to reboot.  Of course, I cannot reboot and have to shut it down myself which might corrupt even more data... If I tried to delete some files after filling the partition, at the reboot they're back and so I'm again with a couple of Kb free. Usually a fsck fixes this problem, but when I do that on / the fsck may not be usable anymore...

Don't we have like 5% of space blocked for this case like on other FS? or something else that would prevent this problem from happening?


I am using the latest rfs4 patch from here with a 2.6.24 kernel and a ccreg40 partition, but this issue has been here for years so nothing new I believe.

Thank you,

John

