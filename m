From: Steve Bergman <steve@rueb.com>
Subject: Re: reiser4 plugins
Date: Fri, 27 Aug 2004 17:29:07 -0500
Message-ID: <1093645747.17445.19.camel@voyager.localdomain>
References: <20040825152805.45a1ce64.akpm@osdl.org>
	 <412D9FE6.9050307@namesys.com>	<20040826014542.4bfe7cc3.akpm@osdl.org>
	 <1093522729.9004.40.camel@leto.cs.pocnet.net>	<20040826124929.GA542@lst.de>
	 <1093525234.9004.55.camel@leto.cs.pocnet.net>	<20040826130718.GB820@lst.de>
	 <1093526273.11694.8.camel@leto.cs.pocnet.net>
	 <20040826132439.GA1188@lst.de>
	 <1093527307.11694.23.camel@leto.cs.pocnet.net>
	 <20040826134034.GA1470@lst.de>
	 <1093528683.11694.36.camel@leto.cs.pocnet.net>
	 <412E786E.5080608@namesys.com>
	 <16687.9051.311225.697109@thebsh.namesys.com>
	 <412F7A59.8060508@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20948-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412F7A59.8060508@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Nikita Danilov <nikita@clusterfs.com>, Christoph Hellwig <hch@lst.de>, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs <reiserfs-list@namesys.com>

On Fri, 2004-08-27 at 11:15 -0700, Hans Reiser wrote:
> >
> If you ask real users, they say that reiser4 is fast, and their 
> experience matches our benchmark.  You can criticize the benchmark if 
> you want, but then you should run your own and publish it.
> 


As a "real" desktop user who just converted all his partitions from ext3
to reiser4, I have not, as yet, noticed any startling performance
increase.  Being slightly slightly irked to hear that the benchmark
numbers that have been paraded around on Slashdot and the internet in
general, at ext3's expense, have had reiser4's "bad" results surgically
extracted, I am running my own benchmarks to get the real story on
reiser4/ext3 mongo performance on my, rather average, desktop hardware.

I am using the latest Mongo on FC/rawhide and the 2.6.8.1-mm4 kernel.

Unfortunately, I get an error from mongo.pl that "Done" is not a numeric
argument at line 439.

I have done this to fix it:


--- mongo.pl    2004-08-27 17:07:01.681723313 -0500
+++ mongo_fixed.pl      2004-08-27 17:06:51.369306735 -0500
@@ -429,8 +429,8 @@
        if ( -e ${ERR_FILE}) {
            &DIE ("\nEXITED WITH FAIL\n");
        }
-       my $real = (split ' ', $time_output[0])[1];
-       my $cpu  = (split ' ', $time_output[2])[1];
+       my $real = (split ' ', $time_output[1])[1];
+       my $cpu  = (split ' ', $time_output[3])[1];
  
        unless ( $real =~ /\s*\d+/ && $cpu =~ /\s*\d+/) {
          LOG "@time_output";


What it gets me is the "real" line of the "time" output for "STAT
REAL_TIME" and the "sys" line of the "time" output for "STAT CPU_TIME".
i.e. only system time is counted. I believe this was the intent of the
original code, but want to verify before continuing.

Thanks,
Steve Bergman

