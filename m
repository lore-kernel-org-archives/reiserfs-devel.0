From: <doiggl@velocitynet.com.au>
Subject: Has anyone successfully repaired a reiser4 file-system , if so how was it done ?
Date: Sat, 11 Jun 2016 19:58:28 +1000
Message-ID: <f3ac2baeec3d6e132ffddb4a36faff6f@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Has anyone successfully repaired a reiser4 file-system , if so how was it
done ?

I use:

# fsck.reiser4 -V
fsck.reiser4 1.1.0
Format release: 4.0.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING. 

# rpm -qa | grep -i reiser4progs
reiser4progs-1.1.0-35.1.x86_64

# rpm -qf /usr/sbin/fsck.reiser4
reiser4progs-1.1.0-35.1.x86_64

Thanks
--Glenn

