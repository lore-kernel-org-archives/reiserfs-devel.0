From: Oleg Drokin <green@namesys.com>
Subject: Re: Data loss during power off
Date: Wed, 26 Jun 2002 09:08:29 +0400
Message-ID: <20020626090829.C5198@namesys.com>
References: <20020626000904.22479.qmail@hm47.locaweb.com.br>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10850-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020626000904.22479.qmail@hm47.locaweb.com.br>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henrique Faria <henrique@streamworks.com.br>
Cc: reiserfs-list@namesys.com

Hello!

   This (almost) cannot be done. Of course you may resort to
   opening files with O_SYNC or issuing sync/fsync calls after each write,
   this way you'd lose even less data by the cost of speed of fs operations.
   At least with this approach you may be sure that after sync/fsync returned
   (or write in case of oepning with O_SYNC), data are safe on the media.
   (This is assuming that your flash memory card does not do any cheating
    and does not report it have completed command before actual writing).

Bye,
    Oleg
On Tue, Jun 25, 2002 at 09:09:04PM +0000, Henrique Faria wrote:
> Hello!
> We're using reiserfs 3.6.25 and linux 2.4.18, in a 256 MB flash memory card,
> to develop a game. Data is written all the time, in local files, by the main
> process. The "power off" test has to be done, for the machines will be
> turned off with no shutdown process.
> What's happening: pressing the power off button (during data writing) makes
> data to be lost. Is it possible to force the data to be written in the file
> system? I tried to change the JOURNAL_MAX_TRANS_AGE and the
> JOURNAL_MAX_COMMIT_AGE consts. Less data is lost, but I still get some loss.
> Thanks,
> 
> Henrique R. Faria
