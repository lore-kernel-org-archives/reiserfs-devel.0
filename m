From: Yury Umanets <umka@namesys.com>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Sun, 27 Jul 2003 18:15:05 +0400
Message-ID: <1059315305.25361.9.camel@haron.namesys.com>
References: <3F1EF7DB.2010805@namesys.com>
	 <1059062380.29238.260.camel@sonja>
	 <16160.4704.102110.352311@laputa.namesys.com>
	 <1059093594.29239.314.camel@sonja>
	 <16161.10863.793737.229170@laputa.namesys.com>
	 <1059142851.6962.18.camel@sonja>
	 <1059143985.19594.3.camel@haron.namesys.com>
	 <1059181687.10059.5.camel@sonja>
	 <1059203990.21910.13.camel@haron.namesys.com>
	 <1059228808.10692.7.camel@sonja>  <3F23D38B.3020309@namesys.com>
	 <1059315015.10692.207.camel@sonja>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15073-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1059315015.10692.207.camel@sonja>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Egger <degger@fhm.edu>
Cc: Hans Reiser <reiser@namesys.com>, Nikita Danilov <Nikita@Namesys.COM>, Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, reiserfs mailing list <reiserfs-list@namesys.com>

On Sun, 2003-07-27 at 18:10, Daniel Egger wrote:
> Am Son, 2003-07-27 um 15.28 schrieb Hans Reiser:
> 
> > it is suitable for any flash device that has wear leveling built into 
> > the hardware (e.g. all compact flash cards)
> 
> Are you sure CF cards have wear leveling? I'm pretty confident that they
> have defect sector management but no wear leveling. There's a huge
> difference between those two.
> 
> > or for which a wear leveling block device driver is used (I don't know
> > if one exists for Linux).
> 
> This is normally done by the filesystem (e.g. JFFS2).

Normally device driver should be concerned about making wear out
smaller. It is up to it IMHO.

-- 
We're flying high, we're watching the world passes by...

