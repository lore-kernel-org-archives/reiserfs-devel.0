From: Edward Shishkin <edward@namesys.com>
Subject: Re: External journals and NVRAM devices
Date: Sat, 02 Nov 2002 00:57:56 +0300
Sender: edward
Message-ID: <3DC2F8E4.AD84886F@namesys.com>
References: <20021101203805.C5E7245609B@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11901-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: JP Howard <jh_lists@fastmail.fm>
Cc: Andreas Dilger <adilger@clusterfs.com>, ReiserFS List <reiserfs-list@namesys.com>, green@namesys.com

JP Howard wrote:
> 
> On Fri, 01 Nov 2002 17:30:18 +0300, "Edward Shishkin"
> <edward@namesys.com> said:
> > Yes. And the experience said that external logging brings a bit better
> > effect for this journal mode then for other ones.
> >
> > > >Is there a command to show the current journal size?
> >
> > #debugreiserfs main_device
> >
> Hmmm...
> ----
> Blocksize: 4096
> <...>
> Journal parameters:
> <...>
>         Size 8193 blocks (including 1 for journal header) (first block
>         18)
> ----
> 
> So my journal is only 32k?

Yes. Standard journal can be only 32K.

 With Ext3 I used 192MB journal in data=journal
> mode. Should I be using a size around that when using data=journal with
> ReiserFS too? Why is the default so low?--is it because the data logging
> patches don't automatically change it?

Reiserfs journal size doesn't depend on journal mode. 

> >
> > The journal size remains the same unless you specify another one by
> > reiserfstune utility.
> >
> And non-standard journal sizes don't work under 2.4, right? Or are there
> patches for this that are reasonably stable?

Yes they are. Let me specify it on next week unless Oleg will do it earlier.
Edward.
