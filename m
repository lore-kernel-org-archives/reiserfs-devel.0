From: Molchanov Alexander <a.molchanov@transtelecom-nn.ru>
Subject: Re: reiserfsck --rebuild-tree Aborted
Date: Thu, 30 Sep 2004 12:35:55 +0400
Message-ID: <20040930123555.77ce375c@xor.ttknn.net>
References: <20040930092442.40ee8189@xor.ttknn.net>
	<20040930115219.31b75bab@xor.ttknn.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21965-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040930115219.31b75bab@xor.ttknn.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu, 30 Sep 2004 11:52:19 +0400
Molchanov Alexander <a.molchanov@transtelecom-nn.ru> wrote:

> > Hello.
> > 
> > I have a big trouble.
> > ...[skiped]...
> > 
> > Pass 2:
> > 0%....20%....40%..                                       left 818621, 4280 /sec
> > Not enough allocable blocks, checking bitmap...there are 0 allocable blocks, btw
> >       
> > out of disk space
> > Aborted
> > 
> > 
> > ...[skiped]...
> 
> 
> Excuse me for troubling. I nevertheless have found on a disk badblocks/badsectors (right at the end of an partition - 3 blocks on 1024).
> 
> Sorry!
> 
> # badblocks -v -o sda2.badb.out /dev/sda2 
> Checking blocks 0 to 10009251
> Checking for bad blocks (read-only test): done                        
> Pass completed, 3 bad blocks found.
> 
> # cat sda2.badb.out 
> 10009248
> 10009249
> 10009250

# reiserfsck --badblocks sda2.badb.out --yes --logfile rebuild.log  --rebuild-tree /dev/sda2
reiserfsck 3.6.17 (2003 www.namesys.com)
...

Will rebuild the filesystem (/dev/sda2) tree
Bad block list will contain only blocks specified in 'sda2.badb.out' file
Will put log info to 'rebuild.log'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
create_badblock_bitmap: block number (10009247) points out of fs size (2502304).
create_badblock_bitmap: block number (10009248) points out of fs size (2502304).
create_badblock_bitmap: block number (10009249) points out of fs size (2502304).
create_badblock_bitmap: block number (10009250) points out of fs size (2502304).
create_badblock_bitmap: block number (10009251) points out of fs size (2502304).
Replaying journal..
Reiserfs journal '/dev/sda2' in blocks [18..8211]: 0 transactions replayed
###########
reiserfsck --rebuild-tree started at Thu Sep 30 12:14:54 2004
###########

Pass 0:
Loading on-disk bitmap .. ok, 2199141 blocks marked used
Skipping 8287 blocks (super block, journal, bitmaps) 2190854 blocks will be read
0%....20%....40%....60%....80%....100%                        left 0, 5765 /sec
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 2190854
                Leaves among those 846944
                Objectids found 475091

Pass 1 (will try to insert 846944 leaves):
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....100%                        left 0, 2740 /sec
Flushing..finished
        846944 leaves read
                34298 inserted
                812646 not inserted

Pass 2:
0%....20%....40%..Not enough allocable blocks, checking bitmap...there are 0 allocable blocks, btw

out of disk space
Aborted

-- 
Molchanov Alexander
TransTeleCom-NN company
Network Operation Center: noc@ttknn.net
phone.: +7 8312 728827 (1424)
        +7 8312 482733 (1424)
a.molchanov@transtelecom-nn.ru
PGP Fingerprint = 50C7 8479 59E4 8228 F27C 5E8C EDF5 FECC 6CA2 B1E2

