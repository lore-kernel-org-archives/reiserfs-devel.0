From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: rebuild-tree hangs
Date: Fri, 11 Apr 2003 12:13:21 +0200
Message-ID: <20030411121321.2a3686b2.philippe.gramoulle@mmania.com>
References: <20030411015312.GA20912@coloppl>
	<200304111356.18574.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13643-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304111356.18574.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hi,

Just my 0.02 euro but why not build reiserfsck statically out of the box ?

This would avoid such problems and also when someone uses a floppy to repair
a root filesystem ( stripped 3.6.5 reiserfsck static binary is about 643 Ko )

Thanks,

Philippe

On Fri, 11 Apr 2003 13:56:18 +0400
Vitaly Fertman <vitaly@namesys.com> wrote:

  | This appears when you compile the progs on one computer not statically
  | and run it on another computer with other libs. Could you tell me what version
  | of reiserfsprogs you use and what glibc version you had on the mashine you
  | compiled reiserfsprog on and glibc version you have on the mashine you run 
  | reiserfsck on?
