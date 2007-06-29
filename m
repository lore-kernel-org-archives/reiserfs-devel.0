From: carmen <_@whats-your.name>
Subject: eliminating intrusive lockups
Date: Fri, 29 Jun 2007 03:24:57 -0400
Message-ID: <20070629072456.GD1626@replic.net>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

inspired by the quality and performance of git and paludis, and frusted by the needless indirection and bloat of existing SQL based RDF storage options, i decided to go filesystem..

 a tree of files,

 /path/to/resource/.s/predicate/object , where object is either a small file, or a symlink to another resource. 

(optimally, the .s dir would go away, and predicate would become some kind of metadata attribute on the resource node, at FS level.. if was getting paid to write a plugin)

so each resource usually has about 5 dirs and 15 files or symlinks. an index is generated as another series of dirs containing symlinks. querying is done by set-intersections of 'ls' inside these index dirs. an index dir typically contains 10 to 1000 files or so. with somewhere around 100K rdf triples or statements, everything is quite instantaneous, which is great. and, what took 210 mb on ext3 takes about 20 mb on reiser4.. since there were a lot of 40-100 byte files taking up 4096 bytes no matter what.. 


the main problem is occasional 'lockups' of the entire filesystem for about 15-20 seconds. this happens every few minutes when running a keyword indexer script which generates tons of symlinks from dirs corresponding to wordnet URIs back to other directories. everything is quite fast really, slow Ruby is checking the existence of hundreds of dirs/symlinks a second it seems. its just some kind of commit is building up and when it has to rebalance a tree or write out, everything just locks up?


im using 2.6.21 vanilla with patches from ftp.namesys.com. since the mm-sources didnt want to mount the fs on boot.. 

/dev/hda1		/    	     reiser4		   	 noatime	      0 1

im not sure if theres any options to tune things, or 'avoid creating lots of files/symlinks at once' (unavoidable in this usage scenario, for data importing)..

rtorrent is also running at the same time with a single torrent, which "differentiates itself from other implementations by transfering directly from file pages to the network stack",

after a few of these freezes, the ipw2200 module panics, something about deferencing a null pointer during a spinloop in tx_data_read or something...

so besides being annoying, this bug contributes to system instability.. ive never had the ipw driver freak out before and have been using it for years  - this is all pretty subjective evidence, but if i ctrl-Z the ruby script the system freezes stop happening, so... :)

any tips? maybe i can bump up fsync() frequency or somethign. i know the ruby VM sucks, but a script shouldnt be able to temporarily halt the system imo..
