From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH CFT] tons of logging patches
Date: Wed, 05 Jun 2002 23:27:16 +0200
Message-ID: <3CFE8234.7010006@mb.tu-ilmenau.de>
References: <1023076301.22608.1778.camel@tiny>	<3CFC1CB5.8040102@mb.tu-ilmenau.de> <1023157228.31475.38.camel@tiny> 	<3CFC33F2.7080009@mb.tu-ilmenau.de> <1023196345.31682.81.camel@tiny> <3CFE7EFB.6080203@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10526-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 06/05/2002 11:13 PM, Manuel Krause wrote:
> On 06/04/2002 03:12 PM, Chris Mason wrote:
>  > On Mon, 2002-06-03 at 23:28, Manuel Krause wrote:
>  >
>  >
>  >>So, VMware is stable with it, too, on my well known "heavy-private-test"
>  >>of it (running Norton SpeedDisk at least twice within a most recent
>  >>VMware Win98). It doesn't show greatly different timings than to my
>  >>setup before though having a different disk i/o pattern (due to the
>  >>missing aa patches)... and me having a reduced RAM from 512to256MB at
>  >>the moment. And I should be honest to say I can't give exact timings as
>  >>the important disk contents changed during last weeks. But the
>  >>disk-access-times/related-to-the-content are definitively _not_ higher
>  >>than before!
>  >
>  >
>  > same speed on 1/2 the ram isn't bad ;-)
>  >
> [...]
> Don't know where to reply best...
[...]

BTW, what is this "only" diff good for (is it worth to recompile, I mean):
# diff '03-beta-data-logging-6.diff' '03-beta-data-logging-5.diff'
2777c2777
< +  if (SB_JOURNAL(p_s_sb)->j_num_lists > 512) {
---
 > +  if (SB_JOURNAL(p_s_sb)->j_num_lists > 256) {

Thank you,

Manuel

> 
> I was extraordinary glad to see the explicit wording of the mounted 
> partition in the logs we missed for so long time!
> 
> Thanks for your help,
> 
> Manuel
> 



