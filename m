From: "Henrique Faria" <henrique@streamworks.com.br>
Subject: Re: Data loss during power off
Date: Thu, 27 Jun 2002 15:34:10
Message-ID: <20020627183410.20055.qmail@hm47.locaweb.com.br>
References: <15643.21032.848083.33358@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10868-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <15643.21032.848083.33358@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Well, changing both JOURNAL_MAX_TRANS_AGE and JOURNAL_MAX_COMMIT_AGE to 0.1
and making the following configuration for flash devices

JOURNAL_BLOCK_COUNT 512
JOURNAL_TRANS_MAX 128
JOURNAL_MAX_BATCH 127 

I was able to force data flush just after the file write C instructions
(with O_SYNC or fsync). I did not get performance problems for while, maybe
because it's a linux dedicated for a single game.

Thanks everybody,

Henrique R. Faria


On Thu, 27 Jun 2002 21:58:00 +0400, Nikita Danilov <Nikita@Namesys.COM>
escreveu :

> De: Nikita Danilov <Nikita@Namesys.COM>
> Data: Thu, 27 Jun 2002 21:58:00 +0400
> Para: "Henrique Faria" <henrique@streamworks.com.br>
> Assunto: Re: [reiserfs-list] Data loss during power off
> 
> Henrique Faria writes:
>  > Nikita,
>  > 
>  > I did not find any download link to Reiser4 in the site at all.
>  > Thanks,
> 
> Sorry, I meant "30 Sept. 2002", of course. Or is it "31 Dec. 2002"? 
> 
> Anyway, wait a bit. :)
> 
>  > 
>  > Henrique
>  > 
>  > On Thu, 27 Jun 2002 12:01:54 +0400, Nikita Danilov <Nikita@Namesys.COM>
>  > escreveu :
>  > 
>  > > De: Nikita Danilov <Nikita@Namesys.COM>
>  > > Data: Thu, 27 Jun 2002 12:01:54 +0400
>  > > Para: "Henrique Faria" <henrique@streamworks.com.br>
>  > > Assunto: Re: [reiserfs-list] Data loss during power off
>  > > 
>  > > Henrique Faria writes:
>  > >  > Does changing JOURNAL_MAX_TRANS_AGE and JOURNAL_MAX_COMMIT_AGE
values
>  > make
>  > >  > any sense? Well, at least, it seemed to.
>  > >  > I read something about Reiser4 APIs to handle transactions, in the
>  > reiser
>  > >  > FAQs (question 47). Nikita Danilov wrote some words mentioning
this
>  > feature.
>  > >  > I wonder if it could solve my problems.
>  > >  > By the way, when reiser4 will be available?
>  > > 
>  > > See http://www.namesys.com:
>  > > 
>  > > Reiser4 is due 30 Sept. 2001.
>  > > 
>  > >  > Thank you all,
>  > >  > 
>  > >  > Henrique R. Faria
>  > >  > 
>  > >  > On Wed, 26 Jun 2002 09:08:29 +0400, Oleg Drokin
<green@namesys.com>
>  > escreveu
>  > >  > :
>  > >  > 
>  > >  > > De: Oleg Drokin <green@namesys.com>
>  > >  > > Data: Wed, 26 Jun 2002 09:08:29 +0400
>  > >  > > Para: Henrique Faria <henrique@streamworks.com.br>
>  > >  > > Assunto: Re: [reiserfs-list] Data loss during power off
>  > >  > > 
>  > >  > > Hello!
>  > >  > > 
>  > >  > >    This (almost) cannot be done. Of course you may resort to
>  > >  > >    opening files with O_SYNC or issuing sync/fsync calls after
each
>  > write,
>  > >  > >    this way you'd lose even less data by the cost of speed of fs
>  > >  > operations.
>  > >  > >    At least with this approach you may be sure that after
sync/fsync
>  > >  > returned
>  > >  > >    (or write in case of oepning with O_SYNC), data are safe on
the
>  > media.
>  > >  > >    (This is assuming that your flash memory card does not do any
>  > cheating
>  > >  > >     and does not report it have completed command before actual
>  > writing).
>  > >  > > 
>  > >  > > Bye,
>  > >  > >     Oleg
>  > >  > > On Tue, Jun 25, 2002 at 09:09:04PM +0000, Henrique Faria wrote:
>  > >  > > > Hello!
>  > >  > > > We're using reiserfs 3.6.25 and linux 2.4.18, in a 256 MB
flash
>  > memory
>  > >  > card,
>  > >  > > > to develop a game. Data is written all the time, in local
files, by
>  > the
>  > >  > main
>  > >  > > > process. The "power off" test has to be done, for the machines
will
>  > be
>  > >  > > > turned off with no shutdown process.
>  > >  > > > What's happening: pressing the power off button (during data
>  > writing)
>  > >  > makes
>  > >  > > > data to be lost. Is it possible to force the data to be
written in
>  > the
>  > >  > file
>  > >  > > > system? I tried to change the JOURNAL_MAX_TRANS_AGE and the
>  > >  > > > JOURNAL_MAX_COMMIT_AGE consts. Less data is lost, but I still
get
>  > some
>  > >  > loss.
>  > >  > > > Thanks,
>  > >  > > > 
>  > >  > > > Henrique R. Faria
>  > >  > > 
>  > >  > > 
>  > >  > > 
>  > >  > 
> 
> Nikita.
> 
>  > > 
>  > > 
>  > > 
>  > 
> 
> 
> 
