From: Oliver Korpilla <okorpil@fh-landshut.de>
Subject: Re: Reiser4 and NFS
Date: Wed, 08 Sep 2004 14:00:06 +0200
Message-ID: <413EF446.1070001@fh-landshut.de>
References: <413C5DBA.1070207@fh-landshut.de> <1094543842.1340.61.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21630-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1094543842.1340.61.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Famous last log entries: ;)

On the target (NFSv3 client):

NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Looking up port of RPC 100003/2 on 192.168.1.1
Looking up port of RPC 100005/1 on 192.168.1.1
VFS: Mounted root (nfs filesystem).
nfs_stat_to_errno: bad nfs status return value: 45
mount_devfs_fs(): unable to mount devfs, err: -5
Freeing unused kernel memory: 236k init
nfs_stat_to_errno: bad nfs status return value: 45
Warning: unable to open an initial console.
nfs_stat_to_errno: bad nfs status return value: 45
nfs_stat_to_errno: bad nfs status return value: 45
nfs_stat_to_errno: bad nfs status return value: 45
nfs_stat_to_errno: bad nfs status return value: 45
Rebooting in 180 seconds..

On the host (NFSv3 server):

Sep  8 13:50:31 ppcproject1 rpc.mountd: authenticated mount request from 
192.168.1.4:800 for /opt/devel/powerpc/rootfs (/opt/devel/powerpc/rootfs)
Sep  8 13:50:32 ppcproject1 kernel: reiser4_encode_fh-3: need=36, lenp=5
Sep  8 13:50:32 ppcproject1 last message repeated 5 times

Guess we've tripped a wire here! It triggered one of your printks...

With kind regards,
Oliver Korpilla
