From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: SMART Self-Test Reports UNC Errors on Dell Latitude D800 Hitachi Travelstar DK23FB
Date: Thu, 12 Aug 2004 19:32:07 +0200
Sender: Bernd Schubert <Bernd.Schubert@tc.pci.uni-heidelberg.de>
Message-ID: <200408121932.08943.bernd-schubert@web.de>
References: <1092327723.16346.7.camel@turing.optivel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20232-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1092327723.16346.7.camel@turing.optivel.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


> My manager suggested that I reformat the partitions (we use ReiserFS
> 3.6), to mark the bad blocks.  Is this a viable option?  Can the drive
> be salvaged, or should it be replaced?
>

Whats your definition of 'reformating'? Its certainly not 
'mkreiserfs /dev/my_partition'. You would need a tool for a low level format 
of the disk, I don't know if there are any for IDE disks.

Smartctl should also return the 'reallocated sector count' values, if those 
are only a few ones, it might be worth a try to run 'badblocks 
-n /dev/my_device', I think most drives only reallocate sectors when data are 
written to them. After this has finished, try the badblocks and smartctl 
command again, if there are still any errors, I would just get a new drive.

Somewhere on the namesys site you will also find an article about badblocks 
handling with reiserfs, but I would do this only in absolut emergency if I 
would need to rescue my data.


Cheers,
	Bernd
