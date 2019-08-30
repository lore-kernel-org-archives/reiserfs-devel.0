From: Deepa Dinamani <deepa.kernel@gmail.com>
Subject: Re: [GIT PULL] vfs: Add support for timestamp limits
Date: Thu, 29 Aug 2019 19:02:13 -0700
Message-ID: <CABeXuvpe9vADLZUr4zHrH0izt=1BaLQvBMxAu=T1A2CV3AN4vA@mail.gmail.com>
References: <20190829041132.26677-1-deepa.kernel@gmail.com>
 <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
 <CAOg9mSR25eAH7e1KhDZt_uscJSzyuSmELbCxgyh=-KWRxjZtcw@mail.gmail.com>
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
 bh=oLvzfsj88KL7STQQplyqqS42g24w/uMRduFS4XzvSOo=; b=fJ3RcsE65hFVciRBlXfCHhVxfX
 chykThCpwHqCSZIEKUWnbfMRN2SFgXQaD5yis80OJvJushsk0eberbRfIoduqrxhZB/94lnucMfvm
 p9SK8bxcJFwi+9V08EeYvvAwZnDGx7njT9IkN42mOJzZvl3pifXAy38rgiZYgxL3g5sk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oLvzfsj88KL7STQQplyqqS42g24w/uMRduFS4XzvSOo=; b=W4U5/bfmamBoFWdPvK7TWp5q7X
 WDRefdqjOkmcxoYD3PQF1dbiQOnhRNhB2rEtJoBglqdD1/DNBYcCx9n9ORGZkm/pMn9dMD9vWCV7t
 mcPTDoEUEPY9kMNI9Ev2iiWTwELXNwQkl+uoLWXIVKLahvjLol/p1+zbRsA5EaNFol2k=;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oLvzfsj88KL7STQQplyqqS42g24w/uMRduFS4XzvSOo=;
 b=SUiSI+Km3m50gBNp/Vf1kQ5Znt7t2xjJr9IjLemKNMiLxz2yhpZsbK/DLZC4L9urNb
 gDxuG7f7XtiecI937GfbQdq+jdln7Z3Fb+8kZnJxwlPpeYQImuMwhjHoDEP857mW1lVb
 NZHRIybWwFHnsioflZzUdQfkXgsEf/TexqY+05N8IO8NvnMnQftjfJ9hFazxqlx7VQO+
 BZ2rZ7/dbzo90ZAvtO0lvvso+7mGgwA9kdlEC7uFLAulP9R+MYUVIvG8IxPGPXul5/em
 IvII12CYogidxhoNLSBGFsf9ZguQCTMWCWKe+z44xwiHPHukomi7gttk607Xpy0ogB0G
 kuPg==
In-Reply-To: <CAOg9mSR25eAH7e1KhDZt_uscJSzyuSmELbCxgyh=-KWRxjZtcw@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
To: Mike Marshall <hubcap@omnibond.com>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Martin Brandenburg <martin@omnibond.com>, jfs-discussion@lists.sourceforge.net, Dave Kleikamp <shaggy@kernel.org>, al@alarsen.net, Bob Copeland <me@bobcopeland.com>, Adrian Hunter <adrian.hunter@intel.com>, Andreas Dilger <adilger.kernel@dilger.ca>, mikulas@artax.karlin.mff.cuni.cz, stoph Hellwig <hch@lst.de>, nico@fluxnic.net, linux-cifs@vger.kernel.org, "Yan,
 Zheng" <zyan@redhat.com>, Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>, y2038 Mailman List <y2038@lists.linaro.org>, Richard Weinberger <richard@nod.at>, Steve French <sfrench@samba.org>, Anton Vorontsov <anton@enomsg.org>, linux@armlinux.org.uk, codalist@coda.cs.cmu.edu, Christoph Hellwig <hch@infradead.org>, coda@cs.cmu.edu, V9FS Developers <v9fs-developer@lists.sourceforge.net>, Ilya Dryomov <idryomov@gmail.com>, Ext4 Developers List <>

On Thu, Aug 29, 2019 at 6:20 PM Mike Marshall <hubcap@omnibond.com> wrote:
>
> Hi Deepa...
>
> I installed this patch series on top of Linux 5.3-rc6 and ran xfstests
> on orangefs and got a regression... generic/258 failed
> with: "Timestamp wrapped"...
>
> # cat results/generic/258.out.bad
> QA output created by 258
> Creating file with timestamp of Jan 1, 1960
> Testing for negative seconds since epoch
> Timestamp wrapped: 0
> Timestamp wrapped
> (see /home/hubcap/xfstests-dev/results//generic/258.full for details)

Note that patch [16/20] https://lkml.org/lkml/2019/8/18/193 assumes
that orangefs does not support negative timestamps.
And, the reason was pointed out in the commit text:

----------------------
Assume the limits as unsigned according to the below
commit 98e8eef557a9 ("changed PVFS_time from int64_t to uint64_t")
in https://github.com/waltligon/orangefs

Author: Neill Miller <neillm@mcs.anl.gov>
Date:   Thu Sep 2 15:00:38 2004 +0000
--------------------

So the timestamp being wrapped to 0 in this case is correct behavior
according to my patchset.
The generic/258 assumes that the timestamps can be negative. If this
is not true then it should not be run for this fs.

But, if you think the timestamp should support negative timestamps for
orangefs, I'd be happy to change it.

> Just to double check, I compiled Linux 5.3-rc6 without the timestamp series,
> and 258 passed... then added the patch series back and the failure returned...
>
> Also.... when I was using "git am" to apply the patch series, the ceph patch
> failed, so I "git skipped" it...

My series applies cleanly against linux-next as of yesterday.

-Deepa
