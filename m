From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Filesystem corruption
Date: Wed, 30 May 2007 20:08:45 +0400
Message-ID: <200705302008.45663.vs@namesys.com>
References: <46598532.5060505@lncsa.com> <200705291215.48354.vs@namesys.com> <1138AFDD-ED08-4390-A418-807A84342AE9@smartgames.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30669-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1138AFDD-ED08-4390-A418-807A84342AE9@smartgames.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Toby Thain <toby@smartgames.ca>
Cc: reiserfs-list@namesys.com

Hello

On Tuesday 29 May 2007 16:36, Toby Thain wrote:
> >>  I have always found reiser3 to be rock solid
> 
> My experienced too, over many server years.
> 
> >> but you can't
> >> mention using reiserfs in mixed company without someone accusing  
> >> you of
> >> throwing your data away.
> 
> People who repeat this rarely have any direct experience of Reiser;  
> they repeat what they've heard; like all myths and legends they are  
> transmitted orally rather than based on scientific observation.
> 
well, there were in past several bad stories when reiserfsck was unable restore filesystems because it was unable to find
reiserfs metadata.
Later we found that sometimes (for unknown (but not likely due to reiserfs problem) reason) partition table changes so that 
beginning of a partition gets shifted by few sectors. So, now, when a user reports that reiserfs metadata disappered from a device completely - recovering a partition table to 
original state makes data available again.

> >> You would think the developers would be doing
> >> more to counter this but I have been following reiserfs for years and
> >> nobody seems to really care all that much.
> >>
> 
> Can't do much about human nature. MySQL suffers from the same  
> baseless poisoned folk wisdom.
> 
> --Toby
> 
> 
