From: Molchanov Alexander <a.molchanov@transtelecom-nn.ru>
Subject: Re: reiserfsck --rebuild-tree Aborted
Date: Thu, 30 Sep 2004 11:52:19 +0400
Message-ID: <20040930115219.31b75bab@xor.ttknn.net>
References: <20040930092442.40ee8189@xor.ttknn.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21964-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040930092442.40ee8189@xor.ttknn.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu, 30 Sep 2004 09:24:42 +0400
Molchanov Alexander <a.molchanov@transtelecom-nn.ru> wrote:

> Hello.
> 
> I have a big trouble.
> ...[skiped]...
> 
> Pass 2:
> 0%....20%....40%..                                       left 818621, 4280 /sec
> Not enough allocable blocks, checking bitmap...there are 0 allocable blocks, btw
>       
> out of disk space
> Aborted
> 
> 
> ...[skiped]...


Excuse me for troubling. I nevertheless have found on a disk badblocks/badsectors (right at the end of an partition - 3 blocks on 1024).

Sorry!

# badblocks -v -o sda2.badb.out /dev/sda2 
Checking blocks 0 to 10009251
Checking for bad blocks (read-only test): done                        
Pass completed, 3 bad blocks found.

# cat sda2.badb.out 
10009248
10009249
10009250

-- 
Molchanov Alexander
TransTeleCom-NN company
Network Operation Center: noc@ttknn.net
phone.: +7 8312 728827 (1424)
        +7 8312 482733 (1424)
a.molchanov@transtelecom-nn.ru
PGP Fingerprint = 50C7 8479 59E4 8228 F27C 5E8C EDF5 FECC 6CA2 B1E2

