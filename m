From: Rodd Zurcher <rodd.zurcher@motorola.com>
Subject: Re: Silly question, defrag
Date: Thu, 04 Apr 2002 16:18:27 -0600
Message-ID: <3CACD133.8020106@motorola.com>
References: <200204030017.12595@X-Message-Flag:> <3CAABBA6.3030101@swelltech.com> <200204030740.05950@X-Message-Flag:> <20020403154906.A21821@ultraviolet.org> <20972156.20020404111651@tnonline.net> <20020404105440.F27377@ultraviolet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Tracy R Reed wrote:

>If there were real value in regularly defragging then Veritas, Sun, IBM,
>HP, and all of those guys would have made defraggers for their respective
>filesystems and it would be considered best practice and standard
>operating procedure to use them. But I have never heard of any such tools
>nor procedures.
>
HP-UX's vxfs (veritas i believe) ships with a defrag tool that packs 
extents and reorders data based on access usage (dir order I believe). 
HPUX documentation did recommend running it and tuning how often by 
ammount of fragmentation. I found on a heavily used ClearCase server a 
nightly run kept fragmentation down; although a weekly run was probably 
all that was necessary. Haven't run HPUX in several years so things may 
be different now.

rbz

-- 
Rodd Zurcher
Principal Software Engineer
SPS/WBSG/WSAS - 847.576.0666
rodd.zurcher@motorola.com



