From: "darren" <teodarren@myrealbox.com>
Subject: OT: NAS solution, Netapp vs EMC
Date: Thu, 16 Oct 2003 21:29:51 +0800
Message-ID: <200310161330.h9GDUgRs004592@northgate.starhub.net.sg>
References: <1065757685.3f862bf55cc7d@www.mailshell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15840-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1065757685.3f862bf55cc7d@www.mailshell.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: slugnet@lists.lugs.org.sg, reiserfs-list@namesys.com

Hi all,

I am looking for a NAS server to work over NFS for 15-20 pieces of my linux
servers.

These servers will be involved in heavy reading and writing (about 30Mbps up
and down each server) of experimental data collected from a network of
probes.

I am thinking of using a NAS solution (I have got a GigE LAN already) from
either NetApp (F825) or EMC (Celerra) as centralized storaged for all the
servers.

I am concerned about the following:

1)	Fast read and write performance for consistant stream of small files
2)	Ability to store LARGE (> 10million per 200GB) amount of small files
3)	Reliability...should not crash or go down when under consistent
heavy load.

Any comments about their performance?

