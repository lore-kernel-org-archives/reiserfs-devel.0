From: David Masover <ninja@slaphack.com>
Subject: Re: Some questions about r4
Date: Thu, 01 Sep 2005 13:43:33 -0500
Message-ID: <43174BD5.1030809@slaphack.com>
References: <431743196ebaa@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25807-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431743196ebaa@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pysiak Satriani <pysiak.satriani@wp.pl>
Cc: Reiserfs List <reiserfs-list@namesys.com>

Pysiak Satriani wrote:
> Hi,
> 
> Is there a r4-patch cooking for 2.6.13 ?

Maybe.  But the patches from 2.6.13-rc6-mm2 applied and ran without any 
trouble at all.  2.6.13-mm1 is out, but I haven't gotten a chance to try it.

For the record, the script to patch just reiser4 from broken-out 
mm-sources is:

cd /usr/src/linux
for patch in `egrep '^reiser4' ../broken-out/series`; do
	patch -p1 < ../broken-out/$patch || break
done

I hope this works, I haven't actually tested it against patches that 
don't apply properly (to see if the break works), and of course it 
currently breaks if patch names have spaces in them.

> Is the requirement for not enabling 4k-stacks going away soon?

Probably not.  Actually, I have no idea, but I would guess that kernel 
inclusion is more important now.

> If I patch a vanilla kernel with r4, and sop using r4, would you say that the changes I introduced by patching are rather safe to the rest of the kernel, or would you recomend going back to vanilla just in case?

Teach your mail client to wrap lines, good god!

Anyway, it would probably be a Best Practice to remove it, but I haven't 
had any stability issues using Reiser4 as my root FS for months and 
months -- has it been a year now?  I can't remember...

So, I doubt it affects the rest of the kernel.  However, I could be 
entirely wrong about this, and that could be why my sound card doesn't 
work in Quake 3 on AMD64, or why I can't get my microphone working, or 
why glxgears is so much slower with my new video card on AMD64 compared 
to my old one on an Athlon-XP.

But somehow, I doubt any of these are true.

