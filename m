From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 for windows
Date: Mon, 17 Jan 2005 08:46:41 -0800
Message-ID: <41EBEBF1.1050408@namesys.com>
References: <20041204211059.41930.qmail@web50908.mail.yahoo.com> <41B287C6.2060902@namesys.com> <41B29491.20405@slaphack.com> <41E9D3DF.1060508@namesys.com> <41EA04B7.3050606@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23159-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41EA04B7.3050606@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Job Bob <yzhang2004@yahoo.com>, reiserfs-list@namesys.com

David Masover wrote:

> Hans Reiser wrote:
> [...]
> |
> |>
> |> To start with, ntfs read access is still case insensitive, last I
> |> checked.  How deep does that go?
> |
> |
> | In reiser4, it is just a directory plugin.
>
> Nono -- how do you give Windows, which is case insensitive, access to a
> case-sensitive filesystem?  For instance, how do you get a Windows-based
> backup program to back up a reiser4 partition from a Linux installation,
> if it has filenames that are identical except for case?

This problem is insoluble.  Either make reiser4 case insensitive and use 
it that way or educate the windows programs or live with bugs.  I see no 
alternative.  Do you?

>
> Or is compatibility not an issue?
>
> |> All this leaves me with the distinct impression that it'd be cheaper to
> |> buy some gigabit ethernet (or fibre) and a Linux CIFS/Samba fileserver
> |> using reiser4.  Steam and others refuse to install on network drives,
> |> Windows probably will not boot off a network drive, but I imagine that
> |> fixing these would be easier than porting a filesystem.
>
> This was awhile ago, and I forget a lot of the context, but I'm
> re-reading this and I agree with myself.

