From: PFC <lists@peufeu.com>
Subject: Re: bad bread
Date: Sun, 07 May 2006 10:35:44 +0200
Message-ID: <op.s8595uohcigqcu@apollo13>
References: <20060505062801.402beb50.boricua@despiertapr.com> <20060507005618.GA21557@rvalles.homedns.org.>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28581-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060507005618.GA21557@rvalles.homedns.org.>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: rvalles <rvalles@es.gnu.org>, reiserfs-list@namesys.com
Cc: boricua@despiertapr.com


> In the event of physical HD failure, the procedure goes like this:

	Get mail saying a HDD is dead. Replace harddisk, resynchronize RAID.
	Use Linux software RAID. Harddrives are cheaper that the time you'll lose  
trying to recover your data.
	I have reiserfs on RAID1 on my PC ; the kernel can distribute random  
reads to both disks, so it is faster and more responsive.
