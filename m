From: Junfeng Yang <yjf@stanford.edu>
Subject: Re: [CHECKER] Do ext2, jfs and reiserfs respect mount -o sync/dirsync
 option?
Date: Mon, 7 Mar 2005 14:29:52 -0800 (PST)
Message-ID: <Pine.GSO.4.44.0503071426070.7096-100000@elaine24.Stanford.EDU>
References: <1110216555.28860.74.camel@localhost.localdomain>
Mime-Version: 1.0
In-Reply-To: <1110216555.28860.74.camel@localhost.localdomain>
Sender: ext2-devel-admin@lists.sourceforge.net
Errors-To: ext2-devel-admin@lists.sourceforge.net
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ext2-devel>,
	<mailto:ext2-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Post: <mailto:ext2-devel@lists.sourceforge.net>
List-Help: <mailto:ext2-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ext2-devel>,
	<mailto:ext2-devel-request@lists.sourceforge.net?subject=subscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum=ext2-devel>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Jan Engelhardt <jengelh@linux01.gwdg.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ext2-devel@lists.sourceforge.net, jfs-discussion@www-124.southbury.usf.ibm.com, reiserfs-list@namesys.com, mc@cs.Stanford.EDU


FiSC can still get those warnings with hdparm -W 0, or with a simple
ramdisk that serves the disk requests whenever they are submitted.

Thanks,
-Junfeng

On Mon, 7 Mar 2005, Alan Cox wrote:

> The IDE layer default is still unfortunately broken and leaves write
> caching enabled. Turn it off with hdparm.
>



-------------------------------------------------------
SF email is sponsored by - The IT Product Guide
Read honest & candid reviews on hundreds of IT Products from real users.
Discover which products truly live up to the hype. Start reading now.
http://ads.osdn.com/?ad_id=6595&alloc_id=14396&op=click
