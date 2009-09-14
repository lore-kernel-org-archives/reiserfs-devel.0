From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 0/4] kill-the-bkl/reiserfs: fix some lock dependency
	inversions
Date: Mon, 14 Sep 2009 23:50:13 +0200
Message-ID: <20090914215011.GM6045@nowhere>
References: <1251167570-5233-1-git-send-email-fweisbec@gmail.com> <20090826201330.GA18761@orion> <20090914203749.GF6045@nowhere> <a4423d670909141433g18659aay6e177b1302e5b4a0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=QVp3DnFMSbAP9L7ZEtEoIW1ByQ4pvUrUDRTUsiNZ/s8=;
        b=sl4mO6jN8ZsrKXp/3zRyrj0xnhT+aHG9G/1Iou4i7IhPo+YNHJQq37CE8ydcM/5Ssy
         YKY5zs6oK9iTTxErlh6Q5qvufZtKvoBWQI3F1H02gWDJELUfno7NXpVIhkqjFif0nNxZ
         y2ivxxtN7SFd+LVmT83U0fkbsAn6wclTQiRJo=
Content-Disposition: inline
In-Reply-To: <a4423d670909141433g18659aay6e177b1302e5b4a0@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Reiserfs <reiserfs-devel@vger.kernel.org>

On Tue, Sep 15, 2009 at 01:33:42AM +0400, Alexander Beregalov wrote:
> > Hi Alexander,
> >
> > It should be fixed now, still in the following tree:
> 
> Hi!
> Another one, similar:
> It is v2.6.31-3123-g99bc470 plus your 805031859(kill-the-bkl/reiserfs:
> panic in case of lock imbalance), UP.
> 
> =======================================================
> [ INFO: possible circular locking dependency detected ]
> 2.6.31-03149-gdcc030a #1
> -------------------------------------------------------
> udevadm/716 is trying to acquire lock:
>  (&mm->mmap_sem){++++++}, at: [<c107249a>] might_fault+0x4a/0xa0



I hate this mm->mmap_sem....



> 
> but task is already holding lock:
>  (sysfs_mutex){+.+.+.}, at: [<c10cb9aa>] sysfs_readdir+0x5a/0x200
> 
> which lock already depends on the new lock.



This is really weird. This is two externals locks from reiserfs.
I guess I created this dependency somewhere, but how...

Anyway, someone reported a similar bug with this tree some months ago,
I've even met it once but could never be able to reproduce it anymore.

I'll try to find out. Thanks!

