From: Alexander Lyamin <flx@msu.ru>
Subject: Re: Mount fails after reiserfsck --rebuild-tree failure
Date: Mon, 23 Jun 2003 13:11:11 +0400
Message-ID: <20030623131111.A19286@t-raenon.nmd.msu.ru>
References: <FCEDLNJPOJKGBCPDLKPGGEFMCBAA.g_luppi@brokerstudio.it>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14665-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <FCEDLNJPOJKGBCPDLKPGGEFMCBAA.g_luppi@brokerstudio.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ing. Davide Imbeni" <davide.imbeni@tei.ericsson.se>, davide.imbeni@tiscali.it
Cc: reiserfs-list@namesys.com

rule number 1,
as soon as you found that your harddisk is about to break - do 
dd_rescue to other disk, ASAP.

then proceed as ussual (--rebuild-tree) on copied image on proven
to be not faulty hardware.

what you did, running rebuild-tree on known-to-be-faulty hdd, is
sure way to get your data WASTED.

Thu, Jun 19, 2003 at 09:11:29PM +0200, Giuliano Luppi wrote:
> Estimated sirs,
> after experiencing some problems accessing files on a reiserfs file system
> (SuSE linux 8.1, kernel 2.4), I tried reiserfsck ?rebuild-tree.
> Since the problem resulted to be in the hardware, it failed, leaving me with
> an unmountable partition (root inode set to 0)
> 
> As suggested in you site?s FAQ (section 2), I tried with the latest
> reiserfsprogs (3.6.7-pre1), installed on another HD (with RedHat). The
> latter also failed.
> 
> Now I know the problems are (a lot of) bad blocks.
> 
> I would like to
> 1.	re-enable mounting the partition, in order to recover some of the data I
> still have there (I know, I should backup more often? :-( )
> 2.	possibly fix the badblocks (as you describe in section 38 of the FAQ), in
> order to bring up the system until new hard disks are ready.
> 
> The main question is: how can I undo the setting of root inode to 0?
> Is there a good way for dealing with faulty hardware with reiserfs?
> 
> Thank you very much for your answers
> 
> Davide Imbeni
> 
> ---
> Outgoing mail is certified Virus Free.
> Checked by AVG anti-virus system (http://www.grisoft.com).
> Version: 6.0.489 / Virus Database: 288 - Release Date: 10/06/2003

-- 
everything zen
lex lyamin
