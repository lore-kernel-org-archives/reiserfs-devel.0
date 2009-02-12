From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: Re: mmotm 2009-02-10-16-35 uploaded (reiser4-quota)
Date: Thu, 12 Feb 2009 05:13:37 +0100
Message-ID: <200902120513.39382.volkerarmin@googlemail.com>
References: <499305AD.4020900@oracle.com> <20090211171324.GC13817@duck.suse.cz> <20090212114737.C8EA.KOSAKI.MOTOHIRO@jp.fujitsu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=+dSzc6o+MGb53EnpirKhvB0pThhTtWpmwRWBauOQWsI=;
        b=EAhyb1crY0YAfYDRfPMWBHRG4OlsyopJ1nV4+bfO5Wn01opuOcc/j8xjpYHPr5SAxi
         w0BIMOqlfi8RR1jx9p+2rbH3UvmTubINu21BGLd3ryx6mOvzbiUkTR4j7NsrU+UagRHb
         /YII/XqVlJbQFpdv5pdBjpDgxE9HTx0ObSntU=
In-Reply-To: <20090212114737.C8EA.KOSAKI.MOTOHIRO@jp.fujitsu.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, Jan Kara <jack@suse.cz>, Randy Dunlap <randy.dunlap@oracle.com>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Donnerstag 12 Februar 2009, KOSAKI Motohiro wrote:
> > On Wed 11-02-09 09:06:53, Randy Dunlap wrote:
> > > akpm@linux-foundation.org wrote:
> > > > The mm-of-the-moment snapshot 2009-02-10-16-35 has been uploaded to
> > > >
> > > >    http://userweb.kernel.org/~akpm/mmotm/
> > > >
> > > > and will soon be available at
> > > >
> > > >    git://git.zen-sources.org/zen/mmotm.git
> > >
> > > mmotm-2009-0210-1635/fs/reiser4/plugin/inode_ops.c:456: error: implicit
> > > declaration of function 'DQUOT_TRANSFER'
> > > mmotm-2009-0210-1635/fs/reiser4/plugin/inode_ops.c:596: error: implicit
> > > declaration of function 'DQUOT_ALLOC_INODE'
> > > mmotm-2009-0210-1635/fs/reiser4/plugin/inode_ops.c:597: error: implicit
> > > declaration of function 'DQUOT_DROP'
> > > mmotm-2009-0210-1635/fs/reiser4/plugin/inode_ops.c:611: error: implicit
> > > declaration of function 'DQUOT_FREE_INODE'
> >
> >   Ah, out of tree filesystems... Could some of Reiser4 guys convert the
> > quota names (they should be vfs_dq_transfer, vfs_dq_alloc_inode,
> > vfs_dq_drop, vfs_dq_free_inode)? I suppose I could do it myself but I'm
> > not sure if it won't clash with some other changes.
> >   Thanks for report Randy.
> >
> > 									Honza
>
> Andrew, recently I've never seen any reiser4 activity in LKML.
> I would suggest to remove it from -mm.

maybe you should look at the reiser4 list before asking for that?
