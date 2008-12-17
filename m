From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [Fwd: [Fwd: Re: Xattrs in reiser4 and Google Summer of Code]]
Date: Thu, 18 Dec 2008 02:18:19 +0300
Message-ID: <494988BB.4020908@gmail.com>
References: <4943B62E.40706@gmail.com> <be789c640812171351k7e2dee9cg50a3803caca231d8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <be789c640812171351k7e2dee9cg50a3803caca231d8@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Horne <daniel.horne@gmail.com>
Cc: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Daniel Horne wrote:
> Hi..

Hello,
Let's cc the list for technical talks, ok?

>
> Thanks for this. I had a brief look at the stat-data plugin, but I
> suspect it's not *quite* general enough to implement the full range of
> xattrs. In particular, you mention below that a stat-data item must be
> under 4000 bytes, and that each stat-data plugin should have its own
> behaviour written for it for reiser4tools.
>

I wanted something like a review to estimate a high boundary for total
amount
of space that can be occupied by pairs (key: value) in one file for
efficient work
of important xattrs applications like Selinux.

> With Xattrs you can pretty much set arbitrary key:value pairs, which
> means that writing a stat-data plugin for each of the possible xattr
> keys is completely impractical.

We don't need a separate stat-data plugin for _each_ possible xattr key:
The common sd-plugin that can scan nodes in order to gather scattered
stat-data of arbitrary length will cover _all_ cases.

> Also, it means that the if expressed as a list, the possible length of
> the xattrs on an inode are potentially a lot longer than 4000.

Can you say more about this?
Do you know an application that requires xattrs of length longer then
4000 bytes?

>
> So, the temptation is to have something similar to the file plugin for
> individual xattrs, with the xattr functions on a vfs file acting like
> a directory of xattr-files. There'd be a large number of small objects
> in the tree, of course, but that's a situation I understand R4 handles
> well..
>
> So, what do you think?

Let's forget about file-as-dir stuff. All what we need is a new file plugin
with non-NULL methods, responsible for work with xattrs , and (maybe)
a new stat-data plugin, which can handle stat-data items of arbitrary
length.

Thanks,
Edward.
