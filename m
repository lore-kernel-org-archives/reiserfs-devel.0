From: "Alec H. Peterson" <ahp@hilander.com>
Subject: Re: Reiser4 unlink performance
Date: Wed, 1 Mar 2006 08:34:48 -0700
Message-ID: <812C5316-42AD-4195-9AF4-F29529950E85@hilander.com>
References: <EE7B7176-15E7-43E9-937B-B084879E62A9@hilander.com> <4404A04F.5010902@namesys.com> <5630744B-8F94-4B23-A228-999F04BD3E58@hilander.com> <200603011827.55282.zam@namesys.com>
Mime-Version: 1.0 (Apple Message framework v746.2)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28178-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200603011827.55282.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>

Hi Hans,

On Mar 1, 2006, at 8:27, Alexander Zarochentsev wrote:

>
> All files created by the program below have zero lentgh, correct?
> Is it the same program as which triggered 'flushing like mad' ?

Correct.

I would be happy to modify it and re-run it however you like.  You  
are correct though that that isn't a real use case for us (0 length  
files).

Alec

