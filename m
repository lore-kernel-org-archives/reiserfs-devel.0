From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: How to build a big file server
Date: 05 Jun 2003 12:24:34 +0200
Message-ID: <1054808673.1997.67.camel@wusel.schnulli.de>
References: <1054800852.1997.15.camel@wusel.schnulli.de>
	 <3EDF15F5.2020908@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14425-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EDF15F5.2020908@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

Am Don, 2003-06-05 um 12.05 schrieb Hans Reiser:
> Heinz-Josef Claes wrote:
> 
> >Hi,
> >
> >I did't found information about my problem on namesys, so I try to ask
> >here.
> >
> >I plan to build a big fileserver for Deutscher Bundestag (German
> >Parliament) who is converting to linux on the server side. In the
> >beginning it will be used in a testing environment and later multiple of
> >them in production use.
> >
> >Here are some questions:
> >
> >- I plan to build a system with IDE 250GB drives. 7 of them for raid 5
> >and one hot spare. The OS will be on separate hardware raid 1 on smaller
> >disks. Does anybody have experience with IDE controlers for the big
> >disks? Is it better to use hardware raid oder software raid
> >(performance)?
> >
> >- At this time, we plan to use reiserfs. What are the advantages /
> >disadvantages of using the raid 1 for journaling for the (big) raid 5
> >(performance, recovery)? The system will be heavily used with
> >storebackup (www.sf.net/projects/storebackup) witch means that lots of
> >hard links have to be created as fast as possible.
> >
> >- BTW: I'm using a ZIP drive on the parallel port with reiserfs. Does it
> >make sense to put the journal for the ZIP drive on the hard disk of the
> >laptop?
> >
> >Thanks for taking your time,
> >Heinz-Josef Claes
> >
> >
> >
> >
> >  
> >
> Do you plan to do synchronous work loads involving lots of little 
> fsyncs?  The RAID 5 will not perform well for that purpose, otherwise it 
> should work well even for the journal.  Chris will correct me if I err.

The used software will copy or compress new files (it gets them via nfs)
to the backup filesystem (reiserfs). For files with a content which
allready exists in the backup, only a hard link is set. It's simply a 
link <oldfile> <newfile>
chown something <newfile>
chmod something <newfile>
in the source (perl). There is *no* explicit sync.
On my PC at home (800MHz, 40 GB "normal cheap IDE disk" (I cannot look
at it at the moment)) I get about 200 hard links per second if nothing
has changed (no copying or compressing). The speed only depends on the
speed of the harddisk. A friend of mine gets the same speed with a 2GHz
processor.


