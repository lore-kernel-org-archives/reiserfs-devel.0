From: Christian Stroetmann <stroetmann@ontolinux.com>
Subject: Re: rebuild-tree fails on large volume
Date: Wed, 10 Aug 2011 03:48:10 +0200
Message-ID: <4E41E35A.5010902@ontolinux.com>
References: <4E3A7945.9090404@i4yoo.de> <alpine.DEB.2.01.1108052344150.9183@trent.utfs.org> <4E4167D2.2020206@i4yoo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4E4167D2.2020206@i4yoo.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux reiserfs-devel <reiserfs-devel@vger.kernel.org>

On the 09.08.2011 19:01, Carsten Ralle wrote:
>>> http://www.spinics.net/lists/reiserfs-devel/msg02679.html
>>> I looked all over the place but couldn't find any infos about the
>>> version to patch.
>> The patch applies cleanly to reiserfsprogs-3.6.21[0].
>> [0] https://www.kernel.org/pub/linux/utils/fs/reiserfs/
> many thanks to all of you: the rebuild-tree (3.6.21-0 + your patch)
> finished this morning and everything looks OK so far, but it'll take a
> while to check all of the data.
>
> Imho the patch should be included as soon as possible to the official
> OpenSuSE reiserfsprogs tree as there still are a lot of people running
> large volumes on ReiserFS v3.6.

We can't follow this argumentation unless it is a special patch for a 
special Linux distribution. But as far as we have followed the 
communication it is a patch that applies in general, and if this is the 
case, then other persons are also interested in this patch. So, we do 
think that it should go to the place where it belongs which is actually [0].

[0] https://www.kernel.org/pub/linux/utils/fs/reiserfs/

Besides this, stop advertising, please. Thanks.

Have fun
Christian *<:o)   O>-<    -(D)>-<

