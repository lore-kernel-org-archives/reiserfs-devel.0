From: Toby Thain <toby@smartgames.ca>
Subject: Re: somewhat OT query on journalling
Date: Wed, 19 Jul 2006 13:30:36 -0400
Message-ID: <BAYC1-PASMTP07DA447E0F0B88B3C634ECBF600@CEZ.ICE>
References: <20060719152744.GA26155@tranquility.scriptkitchen.com>
Mime-Version: 1.0 (Apple Message framework v750)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29076-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060719152744.GA26155@tranquility.scriptkitchen.com>
Message-Id: <0384D231-7A11-49BC-B1BE-FE1480963047@smartgames.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: reiserfs-list@namesys.com


On 19-Jul-06, at 11:27 AM, Payal Rathod wrote:

> Hi, ...
> And lastly don't the journalling fs give a false sense of security to
> the user, saying that the data is written to disk when in reality  
> only an
> entry is made in journal and data is still not committed to disk.

This last one is easy to answer: No. Regardless of the filesystem  
you're using, there is no guarantee your data hits the disk until you  
fsync(). Journalling filesystems don't change this. (And even after  
that, it depends on the device doing the right thing :)

>
> Thanks a lot for the patience and eagerly waiting for any replies.
>
> With warm regards,
> -Payal
>

