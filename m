From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: 2 Terabyte install
Date: Wed, 12 May 2004 09:06:17 +0200
Message-ID: <20040512090617.15dee4d4@philou.gramoulle.local>
References: <409AC2FF.7080800@lindows.com>
	<1083917932.14089.281.camel@tribesman.namesys.com>
	<409BB690.6030604@namesys.com>
	<409BBDC9.3030809@lindows.com>
	<409FB387.8080804@namesys.com>
	<40A19147.4010703@lindows.com>
	<20040512034150.GS9641@schnapps.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18627-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040512034150.GS9641@schnapps.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello,

You can use gpart [1], which Namesys has a patch [2] for, on their web site, to
support reiserfs. I tried it and it works just as expected.

Thanks,

Philippe

[1] http://www.stud.uni-hannover.de/user/76201/gpart/
[2] ftp://ftp.namesys.com/pub/misc-patches/gpart-0.1h-reiserfs-3.6.patch.gz

On Tue, 11 May 2004 21:41:50 -0600
Andreas Dilger <adilger@clusterfs.com> wrote:

  | >    * Is there a tool to determine the type of file system on a
  | >      partition without mounting it?
  | 
  | Lots of them.  "file -s /dev/foo" or if you have a newer e2fsprogs (1.33
  | and newer I think) you can use "blkid [dev ...]" to tell you a bunch of
  | things about each device (LABEL, UUID, TYPE).
  | 
  | Cheers, Andreas
