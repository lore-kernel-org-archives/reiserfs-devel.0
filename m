From: "Henrique Faria" <henrique@streamworks.com.br>
Subject: Re: Data loss during power off
Date: Thu, 27 Jun 2002 12:36:07
Message-ID: <20020627153607.1352.qmail@hm47.locaweb.com.br>
References: <1025189617.1657.19.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10865-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1025189617.1657.19.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>, Henrique Faria <henrique@streamworks.com.br>, reiserfs-list@namesys.com

I'll try the patch! Can JOURNAL_MAX_TRANS_AGE be zero? Do I need to set up
JOURNAL_MAX_COMMIT_AGE too?

On 27 Jun 2002 10:53:37 -0400, Chris Mason <mason@suse.com> escreveu :

> De: Chris Mason <mason@suse.com>
> Data: 27 Jun 2002 10:53:37 -0400
> Para: Henrique Faria <henrique@streamworks.com.br>
> Assunto: Re: [reiserfs-list] Data loss during power off
> 
> On Tue, 2002-06-25 at 17:09, Henrique Faria wrote:
> > Hello!
> > We're using reiserfs 3.6.25 and linux 2.4.18, in a 256 MB flash memory
card,
> > to develop a game. Data is written all the time, in local files, by the
main
> > process. The "power off" test has to be done, for the machines will be
> > turned off with no shutdown process.
> > What's happening: pressing the power off button (during data writing)
makes
> > data to be lost. Is it possible to force the data to be written in the
file
> > system? I tried to change the JOURNAL_MAX_TRANS_AGE and the
> > JOURNAL_MAX_COMMIT_AGE consts. Less data is lost, but I still get some
loss.
> > Thanks,
> 
> The data logging patches also include data=ordered mode.  Using that,
> plus setting the max trans age (or max batch count), will flush data
> blocks right away.
> 
> I'm waiting for a tester to confirm I've fixed the page locking problem
> w/writepage in the current data logging patch, then I'll do a new
> release.
> 
> -chris
> 
> 
> 
> 
> 
