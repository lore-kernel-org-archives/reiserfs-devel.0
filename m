From: "JP Howard" <jh_lists@fastmail.fm>
Subject: Re: External journals and NVRAM devices
Date: Fri, 1 Nov 2002 21:37:03 UT
Message-ID: <20021101213703.D142A50D503@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11904-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>, Andreas Dilger <adilger@clusterfs.com>, ReiserFS List <reiserfs-list@namesys.com>, Oleg Drokin <green@namesys.com>

On Sat, 02 Nov 2002 00:58:40 +0300, "Edward Shishkin"
<edward@namesys.com> said:
> > > ----
> > > Blocksize: 4096
> > > <...>
> > > Journal parameters:
> > > <...>
> > >         Size 8193 blocks (including 1 for journal header) (first block
> > >         18)
> > > ----
> > >
> > > So my journal is only 32k?
> > 
> > Yes. Standard journal can be only 32K.
> 
> Sorry, 32M!
> 
Apologies to all for my lack of reading comprehension. Yes, of course
that shows 32M...

When the 2.4.20 journal-size patches are out I'll try and do some
benchmarking with larger journals on NVRAM devices. We use Cyrus IMAPd
which is very fsync intensive, so I expect an NVRAM journal may make a
big difference...
