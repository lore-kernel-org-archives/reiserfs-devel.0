From: Hans Reiser <reiser@namesys.com>
Subject: Re: OT: Advice on SATA sought
Date: Mon, 29 Mar 2004 07:49:27 -0800
Message-ID: <40684587.2010001@namesys.com>
References: <406605A4.7020903@edsons.demon.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17569-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <406605A4.7020903@edsons.demon.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rudy L. Zijlstra" <rudy@edsons.demon.nl>
Cc: the filesystem <reiserfs-list@namesys.com>

Rudy L. Zijlstra wrote:

> Greetings,
>
>
> I am considering buying some 250G SATA drives (3 in a RAID5 config) 
> for multimedia backend storage.
> disks will likely be WD SATA WD2500JD unless somebody points out good 
> reasons not to. Can get those for about 200 Euro excluding VAT each.
> This is going to be used to store interactively accessed MPEG2 video 
> files. They will be stored from at least 2 (on short notice 3) 
> sources, and simultaously read from 2 or 3 locations. In other words: 
> storage backend for a MythTV setup with 2 or 3 backends, and multiple 
> frontends using a combination of PVR-250 and PVR-350s. 350 for 
> frontend connected to a TV, several frontends using X for output.
>
> The controller i am considering is the Promise SATA TX4.
> kernel: 2.6.4 or later from kernel.org on a recent slackware-current 
> distro.
>
> Any experience, either with this controller, with SATA, with other 
> controllers, please share so I can make a better decision. I've 
> currently no real experience with SATA.
>
> Filesystem choice has been made: Reiserfs3. This is going to be a 
> production machine, I will not yet test Reiserfs4 on that. Too risky 
> considering "comments" i would get on failure...
>
> Regards,
>
> Rudy
>
>
>
xfs might be better for this than v3, to be honest.  delayed allocation 
matters for this workload.

-- 
Hans


