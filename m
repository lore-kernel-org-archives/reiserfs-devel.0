From: sbenni@gmx.de
Subject: Re: reiser4 causes system freeze for 1-2 seconds
Date: Wed, 4 Apr 2007 11:16:55 +0200
Message-ID: <20070404111655.48762c1a@pluto.milky.way>
References: <20070403153755.1fc7bc4b@pluto.milky.way>
	<4612DE74.4060804@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30630-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4612DE74.4060804@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com, xucanhao@gmail.com


Hello Edward, 

first thanks for your answer. 

My system has 1536M. After I has started my system with 512M I copied three different files and the system freezed only once for less than 0,5 seconds and "ent:hda8!" shows up less frequently in top. But after rebooting with 1536M I could not reproduce the longer freezes. So it has to be also related with uptime and programs I'm using. Uptime was 2 days and the most important programs to mention are firefox and azureus. Azureus was downloading to the reiser4 partition but only with 10-15kb/s.

I have rebooted with 512M and will try it some days. 


Thanks

Benni


On Wed, 04 Apr 2007 03:08:36 +0400
Edward Shishkin <edward@namesys.com> wrote:

> sbenni@gmx.de wrote:
> 
> Hello.
> 
> >Hello,
> >
> >I have a 120Gb partition with reiser4. If I start a command like "cp <500mb file> dd" within it the system frequently freezes for 1-2 seconds and ent:hda8! uses nearly 100% cpu. This causes the sound output from xmms to be interrupted and my mouse freezes also. If i renice X and xmms to -10 it is okay. 
> >
> >Is this the desired behaviour ?
> >  
> >
> 
> No.
> 
> >Can I do sth. else than renicing all time critical programs ?
> >
> >My system is a debian amd64 with linux-2.6.16-mm2.
> >  
> >
> 
> How much RAM is available in your system?
> If this is much more then 512M, then boot with "mem=512M", and let
> us know if this freeze still takes place (to make sure this is because of
> unwisely assigned atom_max_size).
> 
> Thanks,
> Edward.
> 
> >
> >Best Regards
> >
> >Benni
> >
> >
> >  
> >
