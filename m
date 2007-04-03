From: Edward Shishkin <edward@namesys.com>
Subject: Re: reiser4 causes system freeze for 1-2 seconds
Date: Wed, 04 Apr 2007 03:08:36 +0400
Message-ID: <4612DE74.4060804@namesys.com>
References: <20070403153755.1fc7bc4b@pluto.milky.way>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30629-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20070403153755.1fc7bc4b@pluto.milky.way>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: sbenni@gmx.de
Cc: reiserfs-list@namesys.com, xucanhao@gmail.com

sbenni@gmx.de wrote:

Hello.

>Hello,
>
>I have a 120Gb partition with reiser4. If I start a command like "cp <500mb file> dd" within it the system frequently freezes for 1-2 seconds and ent:hda8! uses nearly 100% cpu. This causes the sound output from xmms to be interrupted and my mouse freezes also. If i renice X and xmms to -10 it is okay. 
>
>Is this the desired behaviour ?
>  
>

No.

>Can I do sth. else than renicing all time critical programs ?
>
>My system is a debian amd64 with linux-2.6.16-mm2.
>  
>

How much RAM is available in your system?
If this is much more then 512M, then boot with "mem=512M", and let
us know if this freeze still takes place (to make sure this is because of
unwisely assigned atom_max_size).

Thanks,
Edward.

>
>Best Regards
>
>Benni
>
>
>  
>

