From: Oleg Drokin <green@namesys.com>
Subject: Re: mkreiserfs -s 1024 makes unmountable partitions
Date: Mon, 27 Jan 2003 10:42:18 +0300
Message-ID: <20030127104217.B22375@namesys.com>
References: <20030118115724.GA946@Kadath> <20030121213336.GA6756@hell.mine.nu> <20030122065712.D5575@humilis> <20030122100342.GA14100@hell.mine.nu> <20030124222823.GA15643@hell.mine.nu> <20030126181816.GA1274@Kadath> <20030127095957.A22720@namesys.com> <2147483647.1043634047@[10.1.120.1]> <20030127102540.A22869@namesys.com> <2147483647.1043635056@[10.1.120.1]>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12501-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <2147483647.1043635056@[10.1.120.1]>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Scott R. Every" <scott@blast.com>
Cc: Francois-Rene Rideau <fare@tunes.org>, reiserfs-list@namesys.com

Hello!

On Mon, Jan 27, 2003 at 02:37:36AM -0500, Scott R. Every wrote:
> Using MTD and will check out jffs2, but I am also accessing CF cards thru 
> yenta socket.  Would reiserfs or jffs2 be more appropriate for CF cards?

Though there is MTD emulation for block devices, CF cards usually have their
own wear levelling control. On the other hand reiserfs does not offer
data-compression (yet?). Decision is all yours anyway.

Bye,
    Oleg
