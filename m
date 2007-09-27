From: Dave Hansen <haveblue@us.ibm.com>
Subject: Re: 2.6.23-rc8-mm2: BUG near reiserfs_xattr_set
Date: Thu, 27 Sep 2007 13:05:13 -0700
Message-ID: <1190923513.7344.14.camel@localhost>
References: <20070927022220.c76a7a6e.akpm@linux-foundation.org>
	 <46FC021F.8060109@free.fr>
	 <20070927124833.d2691813.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20070927124833.d2691813.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Laurent Riffard <laurent.riffard@free.fr>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Thu, 2007-09-27 at 12:48 -0700, Andrew Morton wrote:
> 
> Hi, Dave!
> 
> > It's fully reproducible.
> > 
> > /home is mounted with the following options:
> >    /dev/mapper/vglinux1-lvhome on /home type reiserfs
> (rw,noatime,nodiratime,user_xattr)
> > 
> > This BUG happened with rc8-mm1 too.
> > rc6-mm1 works fine.
> > I didn't try rc7-mm1. 

Got it.  I'll try to reproduce.  

-- Dave

