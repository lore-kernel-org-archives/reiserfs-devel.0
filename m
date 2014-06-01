From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [RFC 00/32] making inode time stamps y2038 ready
Date: Sun, 1 Jun 2014 06:44:36 +0200
Message-ID: <20140601044436.GC3722@localhost.localdomain>
References: <1401480116-1973111-1-git-send-email-arnd@arndb.de>
 <20140531145114.GA3721@localhost.localdomain>
 <6347520.8jMPlVsFjM@wuerfel>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=taJUC7ymsxt3pcgKcjk9izduycVqx3awNpbu/cbrT78=;
        b=OhZu92JDDIV7zTVFgSd/raej9AL8jZDt4CeFI9OyzsLzsd22V7XhJ+6IPp2lbThum0
         CO31AQI4ytxxnGOavm++DVebldL0xx6hoQtzXc/ZHsW1bITotLT3YAdcbqxDEudaqzdq
         cJK4G/Frr5t6H87fKJeJZdyYW2pKfktIrsB9cTNcXSafkKN7SNXWKZz9++Opdx6GAiEm
         ncNe/AFWTPI/7ANogeH/OALSIvHtc+N1qm9BhvfEnjF3Y3aWM1J/MzMaojRsbyi18edC
         kgZ7de3we5Iwws+6/FGgHrnmsmq/gwhTD7QU5SY17JJxhvmD7BcYm9+SujVdU+MDA839
         ymFA==
Content-Disposition: inline
In-Reply-To: <6347520.8jMPlVsFjM@wuerfel>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, hch@infradead.org, linux-mtd@lists.infradead.org, hpa@zytor.com, logfs@logfs.org, linux-afs@lists.infradead.org, joseph@codesourcery.com, linux-arch@vger.kernel.org, linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org, ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, coda@cs.cmu.edu, geert@linux-m68k.org, linux-ext4@vger.kernel.org, fuse-devel@lists.sourceforge.net, reiserfs-devel@vger.kernel.org, xfs@oss.sgi.com, john.stultz@linaro.org, tglx@linutronix.de, linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, samba-technical@lists.samba.org, linux-f2fs-devel@lists.sourceforge.net, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org, lftan@altera.com, linux-btrfs@vger.kernel.org

On Sat, May 31, 2014 at 05:23:02PM +0200, Arnd Bergmann wrote:
> On Saturday 31 May 2014 16:51:15 Richard Cochran wrote:
> > 
> > Why are some of the time stamp expiration dates marked as "never"?
> 
> It's an approximation:

Also, the term "never" might mean using arbitrarily long integers
as in ASN.1.

Thanks,
Richard
