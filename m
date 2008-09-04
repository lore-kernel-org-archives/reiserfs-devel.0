From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: reiserfs  BUG in 2.6.27-rc5
Date: Wed, 3 Sep 2008 19:20:37 -0700
Message-ID: <20080903192037.e39fa931.randy.dunlap@oracle.com>
References: <48BEBCCB.9000506@oracle.com>
	<hs9ub49fbs1uu11540i0nmdeh143sqgo7f@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <hs9ub49fbs1uu11540i0nmdeh143sqgo7f@4ax.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Coady <gcoady.lk@gmail.com>
Cc: Grant Coady <grant_lkml@dodo.com.au>, lkml <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

On Thu, 04 Sep 2008 10:12:38 +1000 Grant Coady wrote:

> On Wed, 03 Sep 2008 09:35:23 -0700, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> 
> >Running fsx-linux on x86_64.
> 
> Cannot duplicate here, can you tell me which fsx-linux (url) and how 
> called?  I'm running slamd64-12.1 on reiserfs3 here.


fsx-linux from akpm's ext3-tools tarball which is here:
  http://www.zip.com.au/~akpm/linux/patches/stuff/ext3-tools.tar.gz


Run command is (roughly, it's a large script with lots of options):

fsx-linux -l 100M -N 10000 -S 0 /tester/fsxtestfile


---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
