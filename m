From: <doiggl@velocitynet.com.au>
Subject: Re: [PATCHv2 0/3] reiser4: another batch of fixes for 4.2.
Date: Fri, 04 Dec 2015 16:09:37 +1100
Message-ID: <ee26bbb1907a09383b91cead84b89aa2@mail.velocitynet.com.au>
References: <1445727740-12361-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1445727740-12361-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, Edward Shishkin <edward.shishkin@gmail.com>

On Sun, 25 Oct 2015 02:02:17 +0300, Ivan Shapovalov <intelfx100@gmail.com>
wrote:
> These are the fixes for issues I've discovered during migration to 4.2.
> Last one is a real issue causing a reproducible oops in my
configuration,
> first two are byproducts.
> 
> v2: The 3/3 is now a real fix instead of a blind duct-tape fixup.
> 
> Ivan Shapovalov (3):
>   reiser4: remove last traces of JNODE_NEW in the debugging code.
>   reiser4: call account_page_redirty() on re-dirtying pages before
giving
>   them to entd.
>   reiser4: mark pages created during tail2extent conversion as dirty.
> 
>  fs/reiser4/entd.c                        | 1 +
>  fs/reiser4/jnode.c                       | 3 +--
>  fs/reiser4/plugin/file/tail_conversion.c | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)

#

Question.
Are these included in reiser4-for-4.3.0.patch  ?
If not, can they be included in next patchset ?

--Glenn

