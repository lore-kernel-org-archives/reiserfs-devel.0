From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: fsync() Performance Issue
Date: Tue, 07 May 2002 22:26:39 +0200
Message-ID: <3CD8387F.5030107@mb.tu-ilmenau.de>
References: <93F527C91A6ED411AFE10050040665D0049BF9B4@corpusmx1.us.dg.com>	<1020463205.3	 946.252.camel@tiny>	<3CD341EC.9080906@namesys.com>	<1020517884.3947.266.camel@tiny>	<3CD3F76D.4000708@namesys.com> <1020688827.3947.2087.camel@tiny>	<3CD6F3D4.9050103@namesys.com> <1020725839.988.50.camel@tiny> 	<3CD72B37.2010408@mb.tu-ilmenau.de> <1020737096.988.86.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10279-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list <reiserfs-list@namesys.com>

On 05/07/2002 04:04 AM, Chris Mason wrote:

> On Mon, 2002-05-06 at 21:17, Manuel Krause wrote:
> 
>>On 05/07/2002 12:57 AM, Chris Mason wrote:
>>
>>
>>Hi, Chris & Hans!
>>
>>Don't think this somekind of destructive discussion would lead to 
>>anything useful for now, can you post a diff for 
>>2.4.19-pre7+latest-related-pending +compound-patch-from-ftp?
>>
>>I'll try it and report if that leads to more security and/or less 
>>performance on my every day use with NS6 and so on if there is any.
>>
> 
> The current data logging patches are at:
> 
> ftp.suse.com/pub/people/mason/patches/data-logging
> 
> They are against 2.4.19-pre7, and contain versions of the major (stable)
> speedups.  The patch is pretty big, so I'm not likely to merge with the
> namesys pending directories.  The namesys guys add things frequently,
> and I think it would get confusing for people trying to figure out which
> patches to apply.
> 
> The data logging stuff is beta code, if you have a good test bed where
> it's ok if things go wrong I can make you a special patch with the
> pending stuff merged.
> 
> -chris
> 


So, what should I do? I believed in ReiserFS stability so far more than 
usual and it went o.k. since years. I would not consider my notebook a 
safe test bed machine but I do know the value of uptodate backups. ;-)

When the reiserfs speedup patches will go into mainline, what they'll do 
hopefully, you need to adjust your patches anyways:
I don't think it's good if I adjust them myself, as I don't know what I 
may corrupt in the code. Sometimes it's really annoying to edit some 
patches' .diff files when some maintainers decide to add one 
dumb/unneeded blank space or diff path or /usr/src/linux link. I tried 
to rediff/manually-add  your recently posted speedup-patch (IIRC it was 
with the fsync issue for Wayne) over the last weekend and I stopped 
after facing too many identities with the 
existing+pending+compound-speedup-2(-with-iicache-in) code. So do I do 
with  the latest data-logging patches you pointed me to.

I think I'm not approved enough and in need to do your work, as I had 
enough stupidity to merge aa., akpm. and rml. patches for 2.4.19-pre7. 
Choose your poison, like Hans finally meant under the lines, an addon 
mount option in fstab would never be a problem... :-))

BTW, why do you "not believe iicache should be good to use, because 
similar functionality (with less overhead) can be achieved by 
pagecache." as Oleg wrote today?! Is that true and why isn't that 
realized yet?


Bye, thanks and best regards,

Manuel



