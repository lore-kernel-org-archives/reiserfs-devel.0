From: Moritz Angermann <moritz.angermann@gmx.net>
Subject: Re: 3 corruptions found which can only be corrected
	via --rebuild-tree...
Date: 18 Jul 2002 17:35:57 +0200
Sender: Moritz Angermann <cone@caos.mine.nu>
Message-ID: <1027006557.995.2.camel@prototype>
References: <20020718152035.GA779@caos.mine.nu> 
	<200207181134.01409.kuba@mareimbrium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11054-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200207181134.01409.kuba@mareimbrium.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kuba Ober <kuba@mareimbrium.org>
Cc: reiserfs-list@namesys.com

nice idea, so here is what my partition layout looks like:
could you now tell me what commands i shall run exactly ?

[17:25][cone@prototype:~]$ df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda6             4.7G  3.6G  1.1G  77% /
/dev/hda1              28M   11M   16M  40% /boot
/dev/hda7             4.7G  3.5G  1.2G  75% /home
/dev/hda8              14G   14G  2.0M 100% /media/music
/dev/hda9              14G  2.1G   12G  15% /media/movie
/dev/hda10             19G  9.9G  8.3G  55% /backup
/dev/hdb5              19G  5.9G   13G  32% /media/disk0
/dev/hdb6              19G  8.6G   11G  46% /media/disk1
/dev/hdb7              19G  7.8G   11G  42% /media/disk2

Am Don, 2002-07-18 um 17.34 schrieb Kuba Ober:
> On czwartek 18 lipiec 2002 11:20 am, Moritz Angermann wrote:
> > ... so or a lil' bit different was
> > the line reiserfsck told me.
> > so can anyone give me a hand a
> > reach me a step-by-step tutorial how
> > to reiserfsck a root partition ?
> > ( how to create a rescue disk i.e. - w/e is needed)
> 
> easiest way?
> 
> dd your partition to an empty one
> boot to the copy
> repair the main root
> boot to the repaired root
> 
> I usually keep root small (3gigs or so), so it's quite doable then.
> 
> Kuba
> 

