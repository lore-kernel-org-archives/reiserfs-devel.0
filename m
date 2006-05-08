From: PFC <lists@peufeu.com>
Subject: Re: bad bread
Date: Tue, 09 May 2006 00:18:32 +0200
Message-ID: <op.s886w6tlcigqcu@apollo13>
References: <20060505062801.402beb50.boricua@despiertapr.com> <20060507005618.GA21557@rvalles.homedns.org> <op.s8595uohcigqcu@apollo13> <200605081947.k48JldJd029006@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28593-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200605081947.k48JldJd029006@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: rvalles <rvalles@es.gnu.org>, reiserfs-list@namesys.com, boricua@despiertapr.com


> Remember to take backups *anyhow*.  That way, if the RAID controller  
> dumps cow manure on all the sectors, you won't be saying "Oh, SH*T".

	Linux software RAID doesn't need a controller ;)
	But yes, backups should be done anyways.

	IMHO, RAID is good, harddisks are less reliable than the linux kernel,  
the linux RAID layer, and reiserfs.

> Also, note that there exist buggy RAID controllers, where if you are  
> doing
> mirroring to 2 disks, and they develop bad blocks at different locations,
> you can trash the mirror by resynchronizing (basically, you swap out one  
> of
> the bad disks, re-sync, it progresses as far as the bad block on the  
> source
> for the mirror, and dies).

	Linux RAID has a special option for that : you can trigger a check, which  
will re-read the entire disks and, if a read error occurs, re-write the  
failing sector with good data from the other drives in the RAID. The drive  
with the bad sector will then remap it to another sector.

