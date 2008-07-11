From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: What is fixable and what isn't? reiserfsck
Date: Fri, 11 Jul 2008 14:40:13 +0400
Message-ID: <4877388D.7030200@gmail.com>
References: <18384832.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <18384832.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: validator <carlosemilio@hotmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hello.

I guess "fixable" corruption is what can be fixed without --rebuild-tree.
I.e. without involving special fsck passes, that will perform a lot of
unneeded work.

Normally, corruption status is figured out by fsck --check (default mode)
with the following suggestion how to fix it.

Thanks,
Edward.

validator wrote:
> Hello, I've benn trying to find a definition of a "fixable corruption" (or
> minor corruption) versus a "non fixable" corruption. I just know that the
> first kind can be fixed by using reiserfsck --fix-fixable and the second
> kind with --rebuild-tree. I also know that there is a third type that
> affects the superblock and that can be fixed with --rebuild-sb. Could
> someone address me to a more technical definition of what is "fixable" and
> what isn't.
>
> Thanks.
>
>   

