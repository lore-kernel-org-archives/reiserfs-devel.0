From: Hans Reiser <reiser@namesys.com>
Subject: Re: Feature request: online fsync disable
Date: Thu, 05 Sep 2002 14:39:19 +0400
Message-ID: <3D773457.6050601@namesys.com>
References: <3D661C89.C8A805D7@baldauf.org> <15718.8710.244926.960377@laputa.namesys.com> <20020823155658.A962@namesys.com> <3D6623BE.4040500@namesys.com> <20020905035604.GB6004@tapu.f00f.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11375-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Wedgwood <cw@f00f.org>
Cc: Oleg Drokin <green@namesys.com>, Nikita Danilov <Nikita@Namesys.COM>, Xuan Baldauf <xuan--reiserfs@baldauf.org>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>, zam@thebsh.namesys.com

Chris Wedgwood wrote:

>On Fri, Aug 23, 2002 at 03:59:58PM +0400, Hans Reiser wrote:
>
>    It is a reasonable feature request I think.
>
>No it's not.
>
>It's a terrible idea.  If someone calls fsync, they call it for a
>reason and have various expectations.
>
Usually these expectations involve a user not wanting to use mkreiserfs 
at every boot.  If the expectations are wrong, then all power to the user.

>  You should not throw these
>away or else you may as well just start writing random data all over
>the place.
>
>
>
>  --cw
>
>
>  
>



