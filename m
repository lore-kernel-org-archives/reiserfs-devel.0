From: Oleg Drokin <green@namesys.com>
Subject: Re: disk or reiserfs problem?
Date: Thu, 29 May 2003 09:45:11 +0400
Message-ID: <20030529054511.GA30925@namesys.com>
References: <E19L7Co-0002Sb-00@rode.parc.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14296-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <E19L7Co-0002Sb-00@rode.parc.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Breidenbach <jbreiden@parc.com>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, May 28, 2003 at 01:07:27PM -0700, Jeff Breidenbach wrote:
> This is after a hard (power switch) reboot (due to I/O errors). The
> disk in question has about 125 GB of data on a single 200GB reiserfs
> partition. Do people think the disk is toast, or is this possibly some
> correctable filesystem problem? The machine is remote, so I can't
> hdb1: bad access: block=35, count=5
> end_request: I/O error, dev 03:41 (hdb), sector 35

Looks like disk have gone bad. If you are lucky enough, some of the data
still can be recovered. Try to copy entire disk into a file/to another
disk to see how much bad sectors are there.

Bye,
    Oleg
