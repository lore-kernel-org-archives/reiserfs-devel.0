From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Mon, 28 Jul 2003 17:48:53 +0400
Message-ID: <3F2529C5.9050401@namesys.com>
References: <3F1EF7DB.2010805@namesys.com>	 <1059062380.29238.260.camel@sonja>	 <16160.4704.102110.352311@laputa.namesys.com>	 <1059093594.29239.314.camel@sonja>	 <16161.10863.793737.229170@laputa.namesys.com>	 <1059142851.6962.18.camel@sonja>  <3F23CCBC.9070600@namesys.com>	 <1059315409.10692.215.camel@sonja>  <3F251A97.9010409@namesys.com> <1059397619.31053.27.camel@sonja>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15096-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1059397619.31053.27.camel@sonja>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Egger <degger@fhm.edu>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, reiserfs mailing list <reiserfs-list@namesys.com>

So, in summary, reiser4 will do a good job of flushing in large batches 
using large bios, and that is most of what you can do to optimize for 
large erase size.

Things that could be added: improved compression for small files, 
garbage collection based freeing of unused blocks, increasing node size 
to equal erase size.

We can add such features for a fee, or you can code them yourself and 
send us a patch.

If I am wrong about compact flashes all having hardware wear leveling so 
that FAT can be used on them, then you can add wear leveling to the list 
of features desirable.

-- 
Hans


