From: "JP Howard" <jh_lists@fastmail.fm>
Subject: Re: External journals and NVRAM devices
Date: Tue, 5 Nov 2002 22:12:46 UT
Message-ID: <20021105221246.97A295402F0@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11920-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, Chris Mason <mason@suse.com>
Cc: Edward Shishkin <edward@namesys.com>, Andreas Dilger <adilger@clusterfs.com>, ReiserFS List <reiserfs-list@namesys.com>, Oleg Drokin <green@namesys.com>

On Tue, 05 Nov 2002 13:23:30 -0800, "reiser" <reiser@namesys.com> said:
> Chris Mason wrote:
> >The data logging patches include a ton of reiserfs writeback changes
> >that allow good performance with small transactions (like mail server
> >workloads) and small log sizes.
> >
> >With ext3, a 128M or bigger log can really improve performance because
> >so much of the writeback is done through bdflush/kupdate. 
> >
> Please explain the because clause of the sentence above in more detail.
> 
I've just ordered some 1GB Umem NVRAM cards (they're battery-backed RAM
cards that look to Linux like a standard block device). I'd like to use
them to improve performance as much as possible.

Our application is fsync intensive (Cyrus IMAPd server). We have heaps of
RAM, NVRAM, and CPU to spare, but are IO bound. Is there any way to tune
ReiserFS data=journal to improve IO performance by taking advantage of
our spare RAM/NVRAM?

TIA for any info,
  Jeremy
