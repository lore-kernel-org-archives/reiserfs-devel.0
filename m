From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: 2.5.40 (was Re:  ext3 htree vs. reiserfs on 2.5.40-mm1
Date: Fri, 4 Oct 2002 17:54:15 -0400
Message-ID: <200210041754.15087.tomlins@cam.org>
References: <200210042254.23978.Dieter.Nuetzel@hamburg.de> <200210042128.g94LSnF3012807@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11605-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200210042128.g94LSnF3012807@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu, Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On October 4, 2002 05:28 pm, Valdis.Kletnieks@vt.edu wrote:
> (OK, a bit off-topic for the list, but.. ;)
>
> On Fri, 04 Oct 2002 22:54:23 +0200, Dieter =?iso-8859-15?q?N=FCtzel?= said:
> > 2.5.40 is GREAT!
>
> 2.5.40 would be even greater if somebody could point me at a suitable
> replacement for the LVM code I'm currently using - the Sistina people
> have LVM 1.0.5 out for the 2.4 series, but apparently stopped supporting
> 2.5 a while ago.  Is anybody using the LVM2 stuff, or is there some other
> similar things for 2.5?

Look up EVMS.  It can support your lvm1 volumes and more.  They are pushing for
inclusion in 2.5 and have code for 2.5.40.  Having used both lvm1 and evms I perfer 
evms.

Ed

