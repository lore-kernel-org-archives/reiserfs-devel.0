From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@caramail.com>
Subject: Re: reiserfsprogs-3.6.5-pre1
Date: Thu, 5 Dec 2002 16:08:33 +0100
Message-ID: <20021205160833.2ad4695e.philippe.gramoulle@caramail.com>
References: <200212041852.14436.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12119-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200212041852.14436.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hi Vitaly,

I rebuilt the 174Go partition which had wrong file sizes ( already corrected ) with the
new reiserfsck 3.6.5-pre1 and as expected i can see much improvement in pass0:

 Pass 0:
   	 ... left 0, 7385 /sec
 Pass 1:
  	 ... left 0, 2126 /sec
 Pass 2:
 	 ... left 0, 170 /sec

Overall, it took 6 hours instead of 8 which is a very nice improvement.

I have another data set that i'll give 3.6.5-pre1 a try.

Just a note: It would be nice to put a timestamp between the different passes
so we can be sure about the time it takes, and not only look at the number of ops/sec.

Besides, no problem noted with --rebuild-tree with 3.6.5-pre1.

Thanks,

Philippe


On Wed, 4 Dec 2002 18:52:14 +0300
Vitaly Fertman <vitaly@namesys.com> wrote:

  |  
  |  Hi all, 
  |  
  |  The new pre version is available at our ftp site:
  |  ftp.namesys.com/pub/reiserfsprogs/pre
  |  
  |  It includes speedup for pass0, which becomes quite important for 
  |  hignly fragmented object id maps, and a few fixed bugs:
  |  - bug in balancing code led to abort when a leaf could be viewed 
  |  as a block of another type;
  |  - bug in checking statdata size for symlinks allowed to have 
  |  symlinks with holes at the end.
  |  - bug in direct-indirect item convertion let symlinks to be created 
  |  of wrong format.
  |  
