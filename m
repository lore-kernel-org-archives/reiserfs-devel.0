From: =?iso-8859-1?Q?Llu=EDs?= Batlle i Rossell <viric@viric.name>
Subject: Two hangs on reiserfs, linux 3.3.6
Date: Tue, 5 Jun 2012 00:22:08 +0200
Message-ID: <20120604222208.GP1927@vicerveza.homeunix.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hello,

I use reiserfs since years and never saw it hang... but in this compute=
r, that
has two reiserfs on soft RAID1, I've seen two hangs this week.

Here are the sysrq 'w' I could get from dmesg from the two situations, =
I hope
they can help finding out what can this be. All the system works (rootf=
s on
btrfs, two data reiserfs on softraid1), but attempts to use the reiserf=
s trees
end up in hanged processes.

http://viric.name/tmp/hang/nispro-dmesg-hang-reiserfs.txt.gz

http://viric.name/tmp/hang/nispro-dmesg-hang-reiserfs2.txt.gz - this, a=
 few
minutes ago, includes all since boot.

Regards,
Llu=EDs.
