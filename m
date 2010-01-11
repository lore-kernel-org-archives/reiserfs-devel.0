From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 for 2.6.32
Date: Mon, 11 Jan 2010 13:15:54 +0100
Message-ID: <4B4B167A.5070405@gmail.com>
References: <9052e0a91001101300k6b90c97dkba405751db8aeb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <9052e0a91001101300k6b90c97dkba405751db8aeb@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hello.

2.6.32 has a new per-bdi flushing interface and related VFS changes,
which are incompatible with reiser4. Zen stuff works incorrectly, as
actually we need to fix VFS at first. I am working on this at leisure-time,
so wait..

Thanks,
Edward.

Yale Zhang wrote:
> Edward,
>
> I would like to upgrade from Linux 2.6.31  to  2.6.32 and know the zen
> kernel has reiser4 support, but this page
> http://zen-kernel.org/2.6.32-zen3-hot-tea/?searchterm=reiser4 says
> reiser4 has problems. Do you know if the problems are only 2.6.32 and
> not in 2.6.31,  and if so are they serious? Will you release a patch
> for 2.6.32 anytime soon? Thanks.
>
>   


