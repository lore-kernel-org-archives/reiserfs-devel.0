From: Deepa Dinamani <deepa.kernel@gmail.com>
Subject: Re: [GIT PULL] vfs: Add support for timestamp limits
Date: Sat, 31 Aug 2019 15:50:08 -0700
Message-ID: <CABeXuvrm76iKnFrd7Wo=z4d0v7i7xT+Ta37D-mwVwy7-P3YyUg@mail.gmail.com>
References: <20190829041132.26677-1-deepa.kernel@gmail.com>
 <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
 <CAOg9mSR25eAH7e1KhDZt_uscJSzyuSmELbCxgyh=-KWRxjZtcw@mail.gmail.com>
 <CABeXuvpe9vADLZUr4zHrH0izt=1BaLQvBMxAu=T1A2CV3AN4vA@mail.gmail.com>
 <CAK8P3a0NMUv2xOw=fCxJXo_2wbmBMG24Fst3U1LT-m7C8uxz0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1oc+uIAZAMYuOvhDPlikaVjREiDzvlKPCeE4Nt1ZrJE=; b=Xgi4cExYXMEAVD42fL0IUSlEud
 NsuyxKgdLsufH/nLYO0ejqvEPawr5GDpsB4xt+nIjvuVBd3jG3XMcZcZaUN2QGd10aZ0le44Hpk7p
 cvGYHmzmEVisdQGDoTNHxVvO20mhEcmmdVv9Yz3mthSJYFixurnmLRxB9Y/6ySUDkfZ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1oc+uIAZAMYuOvhDPlikaVjREiDzvlKPCeE4Nt1ZrJE=; b=WW9xuaeWm+DCv8uxjCrCHG6s36
 Rod6phCfWnCGAoZBWz+S1It0yBe15YqQVDGt+2VjL2hJkoNZZndgaahT+jqI/SDgTOO++dUxR1fI6
 ihS7YhZq5s3N/m2JAefAazw8KivDG9l6Tgs9y4yR9eu/NW6j0Y4X3fvY8gmD9qsuXY4I=;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1oc+uIAZAMYuOvhDPlikaVjREiDzvlKPCeE4Nt1ZrJE=;
 b=aXcTp5ORUJ9v6lvzIgnO3kFSbLpXDiwrjmF8wY+g2guepKA06q9bi3Rm9msLfVfOjQ
 KNRvWmw8ak6S3NwzAdmSxBIeG1Sb4eSNm5e0ZjmAgk9ZlM4k21SSALJLCNoiAvHUizK4
 zOmrFrhQJgVIgE1sjux3jaSKnzRaF/6H90IkDMl/BMTaq8C/TCYMXEN7O4ZJQQtSqb0a
 GFuX6/WoU+ZaNaNKXJ3mYccQ7I8pJ4ma0YPOCysvVSCuZ0omHUn2dF26yyXMeNNj0vzq
 AXHMjcuekyx7LGzDWacrH+K9/2E8bcBn8KFkWIoTNCkGetG/vTsXGmlPsdXHkSwFh3F/
 GYew==
In-Reply-To: <CAK8P3a0NMUv2xOw=fCxJXo_2wbmBMG24Fst3U1LT-m7C8uxz0w@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
To: Arnd Bergmann <arnd@arndb.de>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Martin Brandenburg <martin@omnibond.com>, jfs-discussion@lists.sourceforge.net, Dave Kleikamp <shaggy@kernel.org>, Anders Larsen <al@alarsen.net>, Bob Copeland <me@bobcopeland.com>, Adrian Hunter <adrian.hunter@intel.com>, Andreas Dilger <adilger.kernel@dilger.ca>, mikulas@artax.karlin.mff.cuni.cz, stoph Hellwig <hch@lst.de>, Nicolas Pitre <nico@fluxnic.net>, Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org, "Yan,
 Zheng" <zyan@redhat.com>, Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>, y2038 Mailman List <y2038@lists.linaro.org>, Richard Weinberger <richard@nod.at>, Steve French <sfrench@samba.org>, Anton Vorontsov <anton@enomsg.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, codalist@coda.cs.cmu.edu, Christoph Hellwig <hch@infradead.org>, coda@cs.cmu.edu, V9FS Developers <v9fs-develo>

> I think it's unclear from the orangefs source code what the intention is,
> as there is a mixed of signed and unsigned types used for the inode
> stamps:
>
> #define encode_PVFS_time encode_int64_t
> #define encode_int64_t(pptr,x) do { \
>     *(int64_t*) *(pptr) = cpu_to_le64(*(x)); \
>     *(pptr) += 8; \
> } while (0)
> #define decode_PVFS_time decode_int64_t
> #define decode_int64_t(pptr,x) do { \
>     *(x) = le64_to_cpu(*(int64_t*) *(pptr)); \
>     *(pptr) += 8; \
> } while (0)
>
> This suggests that making it unsigned may have been an accident.
>
> Then again,  it's clearly and consistently printed as unsigned in
> user space:
>
>         gossip_debug(
>             GOSSIP_GETATTR_DEBUG, " VERSION is %llu, mtime is %llu\n",
>             llu(s_op->attr.mtime), llu(resp_attr->mtime));

I think I had noticed these two and decided maybe the intention was to
use unsigned types.

> A related issue I noticed is this:
>
> PVFS_time PINT_util_mktime_version(PVFS_time time)
> {
>     struct timeval t = {0,0};
>     PVFS_time version = (time << 32);
>
>     gettimeofday(&t, NULL);
>     version |= (PVFS_time)t.tv_usec;
>     return version;
> }
> PVFS_time PINT_util_mkversion_time(PVFS_time version)
> {
>     return (PVFS_time)(version >> 32);
> }
> static PINT_sm_action getattr_verify_attribs(
>         struct PINT_smcb *smcb, job_status_s *js_p)
> {
> ...
>     resp_attr->mtime = PINT_util_mkversion_time(s_op->attr.mtime);
> ...
> }
>
> which suggests that at least for some purposes, the mtime field
> is only an unsigned 32-bit number (1970..2106). From my readiing,
> this affects the on-disk format, but not the protocol implemented
> by the kernel.
>
> atime and ctime are apparently 64-bit, but mtime is only 32-bit
> seconds, plus a 32-bit 'version'. I suppose the server could be
> fixed to allow a larger range, but probably would take it out of
> the 'version' bits, not the upper half.

I had missed this part. Thanks.

> To be on the safe side, I suppose the kernel can only assume
> an unsigned 32-bit range to be available. If the server gets
> extended beyond that, it would have to pass a feature flag.

This makes sense to me also. And, as Arnd pointed out on the IRC, if
there are negative timestamps that are already in use, this will be a
problem for those use cases.
I can update tha patch to use limits 0-u32_max.

-Deepa
