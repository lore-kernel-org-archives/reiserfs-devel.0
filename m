From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Re: [PATCH CFT] tons of logging patches
Date: Tue, 25 Jun 2002 02:55:23 +0200
Message-ID: <3D17BF7B.2090409@mb.tu-ilmenau.de>
References: <1023076301.22608.1778.camel@tiny>	<3CFC1CB5.8040102@mb.tu-ilmenau.de>	<1023	 	157228.31475.38.camel@tiny>	<3CFC33F2.7080009@mb.tu-ilmenau.de>	<1023196345.	 31682.81.camel@tiny>	<3CFE7EFB.6080203@mb.tu-ilmenau.de>	<3CFE8234.7010006@mb.tu-ilmenau.de>	<1023322167.2920.772.camel@tiny> 	<3D07CBE7.5080701@mb.tu-ilmenau.de> <1024274859.11086.68.camel@tiny> 	<3D0D2DEE.7080909@mb.tu-ilmenau.de>  <1024340679.18666.36.camel@tiny> <1024619159.2123.94.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10825-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 06/21/2002 02:25 AM, Chris Mason wrote:
 > ftp.suse.com/pub/people/mason/patches/data-logging has a new
 > beta-data-logging-10.diff.gz
 >
 > This one:
 >
 > compiles as a module (thanks Jeff Mahoney)
 >
 > has a highmem bug fixed with data=journal (help from Andrea)
 >
 > Fixes a problem with relocated/different sized journal devices.  This
 > was a merge error on my part.
 >
 > One tester reports a hang that I can't reproduce here, I'm still trying.
 >
 > -chris
 >
 >
 >

Many thanks to you, Chris!

I applied it on Sunday as I was on a short vacation to Hamburg.de, for
one week before, and your recent patch works very well under
noatime,notail,data=ordered on / still booted with the appropriate
rootflag. (That is my old setup.)
I remarked one difference, I didn't realize this before on ReiserFS.
Having a backup partition previously mounted with fstab settings:
"/dev/hda11  /mnt/beta   reiserfs
noauto,user,noatime,notail,data=ordered   0  0",
I was not able to execute any executable. So it should be normally as I
understand "mount" and its manpage. I had to add a "exec," to the mount
options. Now it works and [this] is right?! ;-)

Is the rootflag needed any more? Does your patchset work with all
pending ReiserFS patches together, now? (Yes, I remember your and your
teams words on 2.4.20-pre...) I didn't try this complete combo again,
just replaced the old beta-data-logging patch in my last (posted) setup.

Last week I got my old RAM renewed (to 512MB again) and some of my old
problems disappeared for now (boot-up overheating symptoms, Oleg told me
about, that are quite assumable (warranty time exceeded)). The load
timings I posted stay the same, so, my aa-akpm-rml patch setup was
really somekind of poor.

Mmh. Now I don't have the old crash pattern any more ;-)
Maybe I push my notebooks power button "accidentally", soon, to test...


Best wishes and greetings,

Manuel




