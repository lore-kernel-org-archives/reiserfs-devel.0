From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Data Corruption with very large files on Reiser3
Date: Mon, 29 Sep 2003 15:23:00 +0400
Message-ID: <200309291523.00393.vitaly@namesys.com>
References: <Pine.LNX.4.51.0309270936120.16317@leandra.the-lab.virtadpt.net> <3F75CE7A.3010607@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15746-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F75CE7A.3010607@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Julia Wolf <julia@virtadpt.net>, Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>

On Saturday 27 September 2003 21:52, Hans Reiser wrote:
> This is a known bug in the big writes optimization, it was fixed, I
> thought the fix was sent to Linus....
>
> Hans
>
> Julia Wolf wrote:
> >  Under both the 2.4.19 and 2.6.0-test5 Linux Kernels, (On an AMD K6-II if

on my 2.4.19 and 2.4.22 evth works fine. probably you applied some patches 
to these kernels?

-- 
Thanks,
Vitaly Fertman
