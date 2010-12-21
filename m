From: Christian Stroetmann <stroetmann@ontolinux.com>
Subject: Re: Reiser4 patches for Linux-2.6.36
Date: Tue, 21 Dec 2010 17:38:18 +0100
Message-ID: <4D10D7FA.8050103@ontolinux.com>
References: <96e4271bc23b8fdc92ebfff1ea270424@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <96e4271bc23b8fdc92ebfff1ea270424@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Glenn D <doiggl@velocitynet.com.au>, linux reiserfs-devel <reiserfs-devel@vger.kernel.org>

Aloha;

On the 21.12.2010 14:06, Glenn (doiggl@velocitynet.com.au) wrote:
> Hello,
> What reiser4 patches are available for the 2.6.36 series.
>
> The following ones I know about:
> - reiser4-for-2.6.36.patch
> - reiser4-fix-entd_flush.patch
>
> I am in the process of building new kernels based reiser4-for-2.6.36 in
> the opensuse build service. See [1]
> Are there any other patch files I should include ?
> Cheers Glenn
>
> [1]https://build.opensuse.org/package/show?package=kernel-reiser4&project=home%3Adoiggl
>

What's with:
- reiser4-fix-write_begin.patch
and maybe
- patch with the basic implementation for reiserfs 3.7
?


Have fun
Christian O>-<   *<:o)   _(D)>-<
