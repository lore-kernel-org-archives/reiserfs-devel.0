From: Petr Sindelar <sindelap@phoenix.inf.upol.cz>
Subject: Expectable "errors" after reiserfsck ?
Date: Mon, 22 Jul 2002 16:33:45 +0200
Message-ID: <20020722163344.A2669@phoenix.inf.upol.cz>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11070-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,
I'm using reiserfs for long time and noticed, that I didn't run reiserfsck for long time too. And since i got some "croslinks" in my mp3 files (the begging of file is from another file of disk, etc), i tried latest reiserfsck with --check. Logs are at http://phoenix.inf.upol.cz/~sindelap/rfs/, but what I want to know-> can i expect reiserfsck will damage both files (original and the crosslinked one?). Thi happened after power down, when I was renaming and tagging these files. What about the errors reiserfsc complains on all volumes? I haven't so much free disk space for backup whole hdd. 
Can I use --fix-fixable or should I use other switches (--rebuild-sb/--rebuild-tree?) On all disks were run rebuild-tree and rebuild-sb about year ago maybe 5 times (strange things with early rfs version)...

Kernel: vanilla 2.4.18 (maybe emu10k driver updated)
partitions created about year or two ago i think (r5 hash)
HDD : / reiserfs
      home+usr LVM+reiserfs (from kernel, i think 0.9 version or so)
     

Thanks for any hints (and of course great fs)
						Petr Sindelar
