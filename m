From: "jds" <jds@soltis.cc>
Subject: Re: Problems with reiserfs when start OpenAFS 1.2.11-fc1 Segmentation fault with kernel 2.4.22-1.2174.nptl
Date: Wed, 3 Mar 2004 19:48:58 -0600
Sender: openafs-info-admin@openafs.org
Message-ID: <20040304014303.M64769@soltis.cc>
References: <20040304005117.M99283@soltis.cc> <20040304005913.M1858@soltis.cc> <20040304002804.GA5722@dbz.icequake.net>
Mime-Version: 1.0
Return-path: <openafs-info-admin@openafs.org>
In-Reply-To: <20040304002804.GA5722@dbz.icequake.net>
Errors-To: openafs-info-admin@openafs.org
List-Help: <mailto:openafs-info-request@openafs.org?subject=help>
List-Post: <mailto:openafs-info@openafs.org>
List-Subscribe: <https://lists.openafs.org/mailman/listinfo/openafs-info>,
	<mailto:openafs-info-request@openafs.org?subject=subscribe>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://lists.openafs.org/mailman/listinfo/openafs-info>,
	<mailto:openafs-info-request@openafs.org?subject=unsubscribe>
List-Archive: <https://lists.openafs.org/pipermail/openafs-info/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Underwood <nemesis-lists@icequake.net>, reiserfs-list@namesys.com
Cc: openafs-info@openafs.org

Hi Ryan:

   Thanks for your help, the client openafs working again.

loop: loaded (max 8 devices)
Journalled Block Device driver loaded
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.19, 19 August 2002 on loop(7,0), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
Found sys_call_table at c033d9f0
Starting AFS cache scan...found 0 non-empty cache files (0%).

[root@angelinux root]# df -T
Filesystem    Type   1K-blocks      Used Available Use% Mounted on
/dev/hda2 reiserfs    12947988   2838624  10109364  22% /
/dev/hda3 reiserfs    10241116     33320  10207796   1% /home
none         tmpfs      382776         0    382776   0% /dev/shm
/var/afscache ext3       92659      4722     83153   6% /usr/vice/cache
AFS            afs     9000000         0   9000000   0% /afs

Regards.

Thanks at all people for help me ( Derek, Pete, Derrick )


---------- Original Message -----------
From: Ryan Underwood <nemesis-lists@icequake.net>
To: reiserfs-list@namesys.com
Sent: Wed, 3 Mar 2004 18:28:04 -0600
Subject: Re: Problems with reiserfs when start OpenAFS 1.2.11-fc1 Segmentation
fault with kernel 2.4.22-1.2174.nptl

> On Wed, Mar 03, 2004 at 07:00:06PM -0600, jds wrote:
> > Hi: Iam compile OpenAFS 1.2.11-fc1 with kernel 2.4.22-1.2174.nptl is OK
> > 
> > problems with reiserfs 3.6 and Fedora Core 1
> > the problems is when start the client AFS recive the messages:
> > 
> > [root@angelinux modload]# service afs start
> > Found libafs-2.4.22-1.2174.nptl-i686.o from SymTable... Loading...
> > Starting AFS services.....
> > /etc/init.d/afs: line 305:  3300 Segmentation fault      /usr/vice/etc/afsd
> > ${AFSD_OPTIONS}
> 
> You can't use the OpenAFS client on a ReiserFS filesystem.  It currently
> only supports ext2/ext3 filesystems.  If you only have reiser
> filesystems, just make a big empty file:
> # dd if=/dev/zero of=/var/afscache
> and make an ext2 filesystem on it:
> # mke2fs -F /var/afscache
> and loop-mount it wherever your afs cache needs to be.
> # mount -o loop,rw /var/afscache /usr/vice/cache
> 
> You can automate this in your fstab:
> /var/afscache /usr/vice/cache ext2 defaults,loop 0 0
> 
> -- 
> Ryan Underwood, <nemesis@icequake.net>
------- End of Original Message -------
