From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck --rebuild-tree Aborted
Date: Thu, 30 Sep 2004 12:46:30 +0400
Message-ID: <200409301246.30322.vitaly@namesys.com>
References: <20040930092442.40ee8189@xor.ttknn.net> <20040930115219.31b75bab@xor.ttknn.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21967-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040930115219.31b75bab@xor.ttknn.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Molchanov Alexander <a.molchanov@transtelecom-nn.ru>, reiserfs-list@namesys.com

On Thursday 30 September 2004 11:52, Molchanov Alexander wrote:
> On Thu, 30 Sep 2004 09:24:42 +0400
>
> Molchanov Alexander <a.molchanov@transtelecom-nn.ru> wrote:
> > Hello.
> >
> > I have a big trouble.
> > ...[skiped]...
> >
> > Pass 2:
> > 0%....20%....40%..                                       left 818621,
> > 4280 /sec Not enough allocable blocks, checking bitmap...there are 0
> > allocable blocks, btw
> >
> > out of disk space
> > Aborted
> >
> >
> > ...[skiped]...
>
> Excuse me for troubling. I nevertheless have found on a disk
> badblocks/badsectors (right at the end of an partition - 3 blocks on 1024).
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


they are not bad blocks. this is the kernel remembers that the fs was 
4k block size and does not allow the access to the last 3 sectors as  
they do not make up a 4k block.

-- 
Thanks,
Vitaly Fertman

