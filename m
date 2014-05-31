From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [RFC 00/32] making inode time stamps y2038 ready
Date: Sat, 31 May 2014 16:51:15 +0200
Message-ID: <20140531145114.GA3721@localhost.localdomain>
References: <1401480116-1973111-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=m/qDo/jw5RnGAKXBa93qC3zg8NxD5t1PV6+cH65dS2k=;
        b=0OcZgSFKhg/qmpgOdGBSX3on7TtSxchva/lErbcWlj5KtOeaeXYT74/38VE9k/yvIb
         zO+z8vy76v1GVshivwLEoOO95nKgQRddfRvlF0FMWfs5LZ0vaXj1F03YpqKiPNjhf0qm
         LSaNOFOXmiZkfzjcg3Vhs4Gv66bmpwChFeYVrMP1gQZygdJTFgD7sJ+uYmiBLqc4Qs1+
         /1Dyzs7+QmhGfzURu0XJzAiJr1MMhrzoYDlVKcTO0MkCUu2RklAl1mxvS96zb8iepi/u
         IvE5b4DzgtX1mAC/OVguR8VmTPukv5lqM5KlumKMXJMlrm9vOvcB3xGY5X3GuyVgBsum
         kXhg==
Content-Disposition: inline
In-Reply-To: <1401480116-1973111-1-git-send-email-arnd@arndb.de>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, hch@infradead.org, linux-mtd@lists.infradead.org, hpa@zytor.com, logfs@logfs.org, linux-afs@lists.infradead.org, joseph@codesourcery.com, linux-arch@vger.kernel.org, linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org, ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, coda@cs.cmu.edu, geert@linux-m68k.org, linux-ext4@vger.kernel.org, fuse-devel@lists.sourceforge.net, reiserfs-devel@vger.kernel.org, xfs@oss.sgi.com, john.stultz@linaro.org, tglx@linutronix.de, linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, samba-technical@lists.samba.org, linux-f2fs-devel@lists.sourceforge.net, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org, lftan@altera.com, linux-btrfs@vger.kernel.org

On Fri, May 30, 2014 at 10:01:24PM +0200, Arnd Bergmann wrote:
> 
> I picked this because it is a fairly isolated problem, as the
> inode time stamps are rarely assigned to any other time values.
> As a byproduct of this work, I documented for each of the file
> systems we support how long the on-disk format can work[1].

Why are some of the time stamp expiration dates marked as "never"?

Thanks,
Richard
