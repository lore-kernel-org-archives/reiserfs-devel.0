From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: mount reiserfs3 REALLY read only?
Date: Mon, 20 Dec 2004 18:28:21 +0300
Message-ID: <1103556500.3615.33.camel@tribesman.namesys.com>
References: <20041206123706.GA25176@melkor.dnp.fmph.uniba.sk>
	 <1102340556.5598.81.camel@tribesman.namesys.com>
	 <20041206165337.GA25094@melkor.dnp.fmph.uniba.sk>
	 <1102592473.3666.53.camel@tribesman.namesys.com>
	 <20041220124922.GA18135@melkor.dnp.fmph.uniba.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22849-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041220124922.GA18135@melkor.dnp.fmph.uniba.sk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Radovan Garabik <garabik@melkor.dnp.fmph.uniba.sk>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2004-12-20 at 15:49, Radovan Garabik wrote:
> On Thu, Dec 09, 2004 at 02:41:14PM +0300, Vladimir Saveliev wrote:
> > Hello
> > 
> > Sorry for delay. I had some problems here
> 
> Never mind, in the meantime I got some external USB harddisks,
> created a 1.1TB software RAID (have you seen a RAID over 4 IDE and 3 USB 
> disks? :-)), copied the partition over and successfully  recovered
> the data.
> 
> This brings us back to the beginning: IMHO having the option to mount
> reiserfs read-only comes sometimes very useful. Apart from emergency
> situations, the size of USB mass storage devices is getting big enough
> to consider putting better filesystem (instead of VFAT) on them. Many of these
> devices have hardware switches to make them read-only, and therefore
> unmountable at the current state of affairs. 
> After clean unmount, you do not need a journal to replay, and since you
> indend to mount the fs read only, you do not need a journal at all.
> XFS can do it with -o norecovery,ro, why reiserfs can't?
> 

Reiserfs has to replay journal to get its structures which provide
access to data into consistent state.

Well, probably, reiserfs could replay journal in memory on -o
norecovery,ro.


