From: carlos@fisica.ufpr.br (Carlos Carvalho)
Subject: Re: reiser3: data=journal causes panic in 2.6.29.4
Date: Sun, 21 Jun 2009 12:14:33 -0300
Message-ID: <19006.20057.249908.171552@fisica.ufpr.br>
References: <19003.42003.291323.769232@fisica.ufpr.br>
	<alpine.DEB.2.01.0906202254510.6439@bogon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.01.0906202254510.6439@bogon>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Christian Kujau (lists@nerdbynature.de) wrote on 20 June 2009 23:07:
 >On Fri, 19 Jun 2009, Carlos Carvalho wrote:
 >> Putting data=journal in the options in fstab makes the kernel stop at
 >> boot complaining it couldn't get a lock.
 >
 >AFAIK there is no data= mount option for reiserfs. Where did you see this 
 >documented?

It's not in the man page; it's mentioned in some posts. Clearly, it's
recognized by mount and passed to the kernel, otherwise there'd be no
panic. Also, after it's mounted we can use
mount -o remount,data=journal. In a freshly mounted partition it seems
to work; there are no hangs, and creating/removing/changing files
works. On a busy fs it hangs.

 >> What's the status of data journaling in reiser3?
 >
 >In which regard?

Does it work? Should it work? Is there any relation to the recent
changes with locking?
