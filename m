From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: External journals and NVRAM devices
Date: Wed, 6 Nov 2002 13:18:32 -0700
Message-ID: <20021106201832.GR588@clusterfs.com>
References: <20021101213703.D142A50D503@server5.fastmail.fm> <1036415792.14291.12.camel@tiny> <3DC836D2.5060100@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11937-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3DC836D2.5060100@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiser <reiser@namesys.com>
Cc: Chris Mason <mason@suse.com>, JP Howard <jh_lists@fastmail.fm>, Edward Shishkin <edward@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, Oleg Drokin <green@namesys.com>

On Nov 05, 2002  13:23 -0800, reiser wrote:
> Chris Mason wrote:
> >With ext3, a 128M or bigger log can really improve performance because
> >so much of the writeback is done through bdflush/kupdate. 
>
> Please explain the because clause of the sentence above in more detail.

Nobody has answered this yet AFAIK, so I will.

The reason that having a large log can help performance is because
having bdflush drive the dirty buffer writeout allows for more changes
of write merging by the elevator and such, and also avoids stalls in
user-space code as it waits for a full journal to commit transactions.

There is a fine line here (for ext3 at least), because if you have a
large journal but it fills up before the transactions have been flushed
to the filesystem, then user apps stall while the journal is flushed
(can be several seconds).

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/

