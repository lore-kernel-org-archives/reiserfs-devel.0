From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 for windows
Date: Tue, 18 Jan 2005 09:03:39 -0800
Message-ID: <41ED416B.8040202@namesys.com>
References: <20041204211059.41930.qmail@web50908.mail.yahoo.com> <41B287C6.2060902@namesys.com> <41B29491.20405@slaphack.com> <41E9D3DF.1060508@namesys.com> <41EA04B7.3050606@slaphack.com> <41EBEBF1.1050408@namesys.com> <41EC99E4.2050708@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23165-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41EC99E4.2050708@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Job Bob <yzhang2004@yahoo.com>, reiserfs-list@namesys.com

David Masover wrote:

>
>
> Hans Reiser wrote:
> | David Masover wrote:
> |
> |> Hans Reiser wrote:
> |> [...]
> |> |
> |> |>
> |> |> To start with, ntfs read access is still case insensitive, last I
> |> |> checked.  How deep does that go?
> |> |
> |> |
> |> | In reiser4, it is just a directory plugin.
> |>
> |> Nono -- how do you give Windows, which is case insensitive, access to a
> |> case-sensitive filesystem?  For instance, how do you get a 
> Windows-based
> |> backup program to back up a reiser4 partition from a Linux 
> installation,
> |> if it has filenames that are identical except for case?
> |
> |
> | This problem is insoluble.  Either make reiser4 case insensitive and use
> | it that way or educate the windows programs or live with bugs.  I see no
> | alternative.  Do you?
>
> Mangling.  Or case-sensitivity (forget who said that NTFS has that).  Or
> force case-insensitive FSes only.  I think all three would work in
> different situations, and I don't think it would be too difficult to add
> all three.

Ok, so it is soluble.

>
> Just for clarification -- mangling is how VFAT is backwards-compatible
> with DOS, for example.  myreallylongfile.doc becomes MYREAL~1.DOC when
> viewed from DOS, so that while VFAT should really be read with Windows
> 95 or better (Linux), it can still be accessed in Dos.
>
> This loses information (if a DOS program backs up and restores
> MYREAL~1.DOC, you lose the long (myreallylongfile.doc) name.)  But
> sometimes there's no alternative, and if you mangle it (instead of just
> chopping off the end of the filename) you avoid collisions -- that is,
> if you have:
>
> myreallylongfile.doc
> myreallife.doc
>
> then they become
>
> MYREAL~1.DOC
> MYREAL~2.DOC
>
>
>
> Only question is, where to set which of these to choose (mangle or case
> sensitivity)?  Maybe it could be per-directory, most likely per-mount.
> But I have no idea how Windows passes mount options ... I don't think it
> has any mount options at all.
>
well, all this assumes we have resources to spare from debugging reiser4 
for linux.....;-)
