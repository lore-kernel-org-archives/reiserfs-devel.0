From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: nfs
Date: Sat, 15 Nov 2003 23:48:12 +0200
Message-ID: <20031115214812.GD25876@hvs.envisage.co.za>
References: <1068931388.2186.6.camel@redeeman.linux.dk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16099-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1068931388.2186.6.camel@redeeman.linux.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Redeeman <redeeman@metanurb.dk>
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

On Sat, Nov 15, 2003 at 10:23:08PM +0100, Redeeman wrote:
> i have read that nfs dont work with reiserfs, but even though that, i
> made an export, and it works just perfect, is it dangoures somehow?

Several moons ago, there were problems with reiserfs and NFS, as
reiserfs didn't (still don't?) have the notion of inodes, which is
used in NFS for filehandle information. there were a quick work around
which didn't work that well, but the current 2.4.x kernels and Reiserfs 3.6
works sofar without troubles.


Hendrik
