From: Russell Coker <bofh@coker.com.au>
Subject: Re: Raid5, LVM and Reiserfs
Date: Mon, 21 Oct 2002 07:51:39 +0200
Message-ID: <200210210751.39155.bofh@coker.com.au>
References: <000701c277c9$ef8d6c70$0101a8c0@bummer> <200210210449.g9L4n50g022158@turing-police.cc.vt.edu> <3DB392F6.3000603@namesys.com>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11729-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DB392F6.3000603@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Mon, 21 Oct 2002 07:39, Hans Reiser wrote:
> >You may wish to verify further.  Has the hardware raid controller been
> >identified as being slower than *software* RAID-5?  (Remember - if you do
> >it in software, you have to do a disk write per disk).  Or is the RAID
> >controller merely "not as fast as other hardware RAID controllers)?
>
> It would be surprising if any hardware RAID controller was as bad as
> software RAID.  I agree that measuring is advisable.   I would be
> curious to see numbers on something like that.

It's fairly common for low-end RAID hardware to have limitations of memory or 
CPU bandwidth that limit the bulk IO rate.  Hardware RAID that can only 
sustain 10M/s was quite common until very recently.

However such hardware RAID did well on random IO tests, so the result you get 
depends on what exactly you do (as usual).

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

