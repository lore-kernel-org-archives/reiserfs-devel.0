From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck segmentation fault
Date: Thu, 22 Aug 2002 17:06:11 +0400
Message-ID: <20020822170611.B6550@namesys.com>
References: <1874477781.20020822131021@pch-edv.com> <20020822151427.A5603@namesys.com> <347248875.20020822135632@pch-edv.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11293-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <347248875.20020822135632@pch-edv.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Herklotz <linux@pch-edv.com>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Aug 22, 2002 at 01:56:32PM +0200, Peter Herklotz wrote:
> thanks for the advice, reiserfsck (3.6.3) is working heavily now - lets hope
> it can rebuild the content of the partition. But another question
> arises for me: As I pointed out in my first posting, I had to do a
> "reiserfsck --rebuild-sb" first before the partition was even recognized
> as an reiserfs one. As I said, I wasn't sure which version of the fs I
> had. How dangerous is it to choose a wrong "3.5.x"-version at that
> point? The only thing that I am sure of is that it wasn't a 3.6
> version.

wrong 3.5 version is dangerous because they have different bitmaps layout.

Bye,
    Oleg
