From: Christian Iversen <chrivers@iversen-net.dk>
Subject: Re: [PATH] "metas" in reiserfs v4 snapsot 2004.03.26
Date: Mon, 29 Mar 2004 15:27:40 +0200
Message-ID: <200403291527.40994.chrivers@iversen-net.dk>
References: <20040329104359.GP5229@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17561-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040329104359.GP5229@nysv.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


> It may superficially seem equal, if there's a directory that's invisible,
> but still exists. I mean, the name of the directory may seem unimportant.
>
> It is not. Anyone who wants to use the metas will know how to do it,
> no matter what the name. I think Piotr Neuman's patch is a prerequisite
> for getting this baby into the mainline kernel.
>
> ..pseudo/ was a good solution, ..metas/ is more descriptive and just
> as inoffensive.

As a complete reiserfs outsider, who is just interested in using a good 
filesystem, I agree :)

If I had anything to say, I would go for ".meta". 

Using a name like "metas" WILL introduce breakage in many cases. As previously 
mentioned: tar-balls, user scripts and other cases. 

But who am I to tell you that?... I'm not a reiserfs developer ;)

-- 
Regards,
Christian Iversen
