From: myciel <myciel@dotcom.pl>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Wed, 10 Sep 2003 10:29:44 +0200
Message-ID: <3F5EE0F8.1010208@dotcom.pl>
References: <3F1EF7DB.2010805@namesys.com>	 <1059062380.29238.260.camel@sonja>	 <16160.4704.102110.352311@laputa.namesys.com>	 <1059093594.29239.314.camel@sonja>	 <16161.10863.793737.229170@laputa.namesys.com>	 <1059142851.6962.18.camel@sonja>	 <1059143985.19594.3.camel@haron.namesys.com>	 <1059181687.10059.5.camel@sonja>	 <1059203990.21910.13.camel@haron.namesys.com> <1059228808.10692.7.camel@sonja> <3F23D38B.3020309@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15616-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F23D38B.3020309@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs mailing list <reiserfs-list@namesys.com>

Hans Reiser wrote:

> it is suitable for any flash device that has wear leveling built into 
> the hardware (e.g. all compact flash cards), or for which a wear 
> leveling block device driver is used (I don't know if one exists for 
> Linux).


I'm thinking about using ide flash disk for journal device - is it good 
idea?
there are such disks with wear leveling available,
but can someone tell difference betwen dynamic and static wear leveling?

thanks

rafal


